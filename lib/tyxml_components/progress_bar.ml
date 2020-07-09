module Make (Tyxml : Tyxml_sigs.S) = struct
  type color =
    [ `green
    | `purple
    | `blue
    ]

  let label_class_of_color = function
    | `green ->
      "text-green-600 bg-green-200"
    | `purple ->
      "text-purple-600 bg-purple-200"
    | `blue ->
      "text-blue-600 bg-blue-200"

  let score_class_of_color = function
    | `green ->
      "text-green-600"
    | `purple ->
      "text-purple-600"
    | `blue ->
      "text-blue-600"

  let bg_class_of_color = function
    | `green ->
      "bg-green-200"
    | `purple ->
      "bg-purple-200"
    | `blue ->
      "bg-blue-200"

  let fg_class_of_color = function
    | `green ->
      "bg-green-500"
    | `purple ->
      "bg-purple-500"
    | `blue ->
      "bg-blue-500"

  let createElement ~label:label_ ~percentage ~color () =
    let open Tyxml.Html in
    let percentage = max 0 (min 100 percentage) in
    let progress_label = string_of_int percentage ^ "%" in
    let label_class = label_class_of_color color in
    let score_class = score_class_of_color color in
    let bg_class = bg_class_of_color color in
    let fg_class = fg_class_of_color color in
    div
      ~a:[ a_class [ "relative" ] ]
      [ div
          ~a:[ a_class [ "flex mb-2 items-center justify-between" ] ]
          [ div
              [ span
                  ~a:
                    [ a_class
                        [ "text-xs font-semibold inline-block py-1 px-2 \
                           uppercase rounded-full "
                          ^ label_class
                        ]
                    ]
                  [ txt label_ ]
              ]
          ; div
              ~a:[ a_class [ "text-right" ] ]
              [ span
                  ~a:
                    [ a_class
                        [ "text-xs font-semibold inline-block " ^ score_class ]
                    ]
                  [ txt progress_label ]
              ]
          ]
      ; div
          ~a:
            [ a_class [ "overflow-hidden h-2 text-xs flex rounded " ^ bg_class ]
            ]
          [ div
              ~a:
                [ a_style ("width: " ^ string_of_int percentage ^ "%")
                ; a_class
                    [ "shadow-none flex flex-col text-center whitespace-nowrap \
                       text-white justify-center "
                      ^ fg_class
                    ]
                ]
              []
          ]
      ]

  let make = createElement ()
end
