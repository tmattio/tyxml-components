module Make (Tyxml : Tyxml_sigs.S) = struct
  module Error_icon = struct
    let createElement () =
      let open Tyxml.Html in
      svg
        ~a:
          [ Svg.a_class [ "h-5"; "w-5" ]
          ; Svg.a_fill `CurrentColor
          ; Svg.a_viewBox (0., 0., 20., 20.)
          ]
        [ Svg.path
            ~a:
              [ Xml.string_attrib "fill-rule" "evenodd" |> Svg.to_attrib
              ; Svg.a_d
                  "M8.257 3.099c.765-1.36 2.722-1.36 3.486 0l5.58 9.92c.75 \
                   1.334-.213 2.98-1.742 2.98H4.42c-1.53 \
                   0-2.493-1.646-1.743-2.98l5.58-9.92zM11 13a1 1 0 11-2 0 1 1 \
                   0 012 0zm-1-8a1 1 0 00-1 1v3a1 1 0 002 0V6a1 1 0 00-1-1z"
              ; Xml.string_attrib "clip-rule" "evenodd" |> Svg.to_attrib
              ]
            []
        ]
  end

  let error_icon = Error_icon.createElement ()

  module Success_icon = struct
    let createElement () =
      let open Tyxml.Html in
      svg
        ~a:
          [ Svg.a_class [ "h-5"; "w-5" ]
          ; Svg.a_fill `CurrentColor
          ; Svg.a_viewBox (0., 0., 20., 20.)
          ]
        [ Svg.path
            ~a:
              [ Xml.string_attrib "fill-rule" "evenodd" |> Svg.to_attrib
              ; Svg.a_d
                  "M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 \
                   00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 \
                   2a1 1 0 001.414 0l4-4z"
              ; Xml.string_attrib "clip-rule" "evenodd" |> Svg.to_attrib
              ]
            []
        ]
  end

  let success_icon = Success_icon.createElement ()

  module Warning_icon = struct
    let createElement () =
      let open Tyxml.Html in
      svg
        ~a:
          [ Svg.a_class [ "h-5"; "w-5" ]
          ; Svg.a_fill `CurrentColor
          ; Svg.a_viewBox (0., 0., 20., 20.)
          ]
        [ Svg.path
            ~a:
              [ Xml.string_attrib "fill-rule" "evenodd" |> Svg.to_attrib
              ; Svg.a_d
                  "M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 \
                   00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 \
                   11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 \
                   10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
              ; Xml.string_attrib "clip-rule" "evenodd" |> Svg.to_attrib
              ]
            []
        ]
  end

  let warning_icon = Warning_icon.createElement ()

  module Info_icon = struct
    let createElement () =
      let open Tyxml.Html in
      svg
        ~a:
          [ Svg.a_class [ "h-5"; "w-5" ]
          ; Svg.a_fill `CurrentColor
          ; Svg.a_viewBox (0., 0., 20., 20.)
          ]
        [ Svg.path
            ~a:
              [ Xml.string_attrib "fill-rule" "evenodd" |> Svg.to_attrib
              ; Svg.a_d
                  "M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 \
                   012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 \
                   00-1-1H9z"
              ; Xml.string_attrib "clip-rule" "evenodd" |> Svg.to_attrib
              ]
            []
        ]
  end

  let info_icon = Info_icon.createElement ()

  type t =
    [ `error of string
    | `success of string
    | `warning of string
    | `info of string
    ]

  let bg_of_t = function
    | `error _ ->
      "bg-red-50"
    | `success _ ->
      "bg-green-50"
    | `warning _ ->
      "bg-yellow-50"
    | `info _ ->
      "bg-blue-50"

  let text_of_t = function
    | `error _ ->
      "text-red-700"
    | `success _ ->
      "text-green-700"
    | `warning _ ->
      "text-yellow-700"
    | `info _ ->
      "text-blue-700"

  let icon_of_t =
    let open Tyxml.Html in
    function
    | `error _ ->
      i ~a:[ a_class [ "text-red-400" ] ] [ error_icon ]
    | `success _ ->
      i ~a:[ a_class [ "text-green-400" ] ] [ success_icon ]
    | `warning _ ->
      i ~a:[ a_class [ "text-yellow-400" ] ] [ warning_icon ]
    | `info _ ->
      i ~a:[ a_class [ "text-blue-400" ] ] [ info_icon ]

  let message_of_t = function
    | `error s | `success s | `warning s | `info s ->
      s

  let createElement ~message:t () =
    let open Tyxml.Html in
    let bg_class = [ "rounded-md"; "p-4"; bg_of_t t ] in
    let text_class = [ "text-sm"; "leading-5"; text_of_t t ] in
    let message = message_of_t t in
    div
      ~a:[ a_class bg_class ]
      [ div
          ~a:[ a_class [ "flex" ] ]
          [ div ~a:[ a_class [ "flex-shrink-0" ] ] [ icon_of_t t ]
          ; div
              ~a:[ a_class [ "ml-3" ] ]
              [ div ~a:[ a_class text_class ] [ txt message ] ]
          ]
      ]

  let make (t : t) = createElement ~message:t ()
end
