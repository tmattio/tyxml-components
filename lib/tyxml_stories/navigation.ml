open! Base
open! Js_of_ocaml

type location =
  { href : string
  ; host : string
  ; hostname : string
  ; protocol : string
  ; origin : string option
  ; port_ : string
  ; pathname : string
  ; search : string
  ; hash : string
  }
[@@deriving sexp, compare, fields]

let location_of_js location =
  { href = location##.href |> Js.to_string
  ; host = location##.host |> Js.to_string
  ; hostname = location##.hostname |> Js.to_string
  ; protocol = location##.protocol |> Js.to_string
  ; origin = Js.Optdef.map location##.origin Js.to_string |> Js.Optdef.to_option
  ; port_ = location##.port |> Js.to_string
  ; pathname = location##.pathname |> Js.to_string
  ; search = location##.search |> Js.to_string
  ; hash = location##.hash |> Js.to_string
  }
