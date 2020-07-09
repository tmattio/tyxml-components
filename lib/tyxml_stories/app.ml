open Core_kernel
open Incr_dom
open! Js_of_ocaml

let index_component =
  Register.
    { name = "Welcome to Tyxml component library"
    ; url = ""
    ; view =
        (let open Incr_dom.Tyxml.Html in
        p [ txt "Select a component in the left navigation bar" ])
    }

let not_found_component =
  Register.
    { name = "Not found"
    ; url = ""
    ; view =
        (let open Incr_dom.Tyxml.Html in
        p [ txt "Select a component in the left navigation bar" ])
    }

module Model = struct
  type t = { location : string } [@@deriving sexp, fields, compare]

  let cutoff t1 t2 = compare t1 t2 = 0

  let update_location _t location = { location }

  let empty =
    { location = (Navigation.location_of_js Dom_html.window##.location).hash }
end

module Action = struct
  type t = UrlChange of Navigation.location [@@deriving sexp]
end

module State = struct
  type t = { schedule : Action.t -> unit } [@@deriving fields]
end

let apply_action model (action : Action.t) _ ~schedule_action:_ : Model.t =
  match (action : Action.t) with
  | UrlChange location ->
    Model.update_location model location.hash

(** Listen for the Dom hash change event. This binds to the event for the
    lifecycle of the application. *)
let route_change_event ~f =
  let open Js_of_ocaml in
  Js.some
    (Dom.addEventListener
       Dom_html.window
       Dom_html.Event.hashchange
       (Dom_html.handler (fun (_ev : #Dom_html.event Js.t) ->
            f (Navigation.location_of_js Dom_html.window##.location);
            Js._true))
       Js._false)

let view model ~inject:_ ~components =
  let open Incr.Let_syntax in
  let%map model = model in
  let location =
    match model.Model.location with
    | s when String.length s > 1 && Char.equal s.[0] '#' ->
      String.sub s ~pos:1 ~len:(String.length s - 1)
    | s ->
      s
  in
  let component =
    match location with
    | "" ->
      index_component
    | _ ->
      List.find components ~f:(fun cmp ->
          String.equal cmp.Register.url location)
      |> Option.value ~default:not_found_component
  in
  let elt = Layout.make ~components component in
  Virtual_dom.Tyxml.Html.toelt elt

let on_startup ~schedule_action:schedule _ =
  let state = { State.schedule } in
  let _event =
    route_change_event ~f:(fun loc -> schedule (Action.UrlChange loc))
  in
  Async_kernel.return state

let on_display ~old_model:_ _ ~schedule_action:_ = ()

let create model ~old_model ~inject =
  let open Incr.Let_syntax in
  let%map apply_action =
    let%map model = model in
    apply_action model
  and on_display =
    let%map old_model = old_model in
    on_display ~old_model
  and view = view model ~inject ~components:(Register.all ())
  and model = model in
  Incr_dom.Component.create ~apply_action ~on_display model view
