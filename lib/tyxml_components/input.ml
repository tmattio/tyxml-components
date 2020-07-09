module Make (Tyxml : Tyxml_sigs.S) = struct
  let createElement
      ~id
      ?name
      ?label:l
      ?(show_label = true)
      ?placeholder:ph
      ?(type_ = `Text)
      ?(required = true)
      ?help
      ?hint
      ()
    =
    let open Tyxml.Html in
    div
      [ (match hint with
        | Some hint ->
          div
            ~a:[ a_class [ "flex justify-between" ] ]
            [ label
                ~a:
                  [ a_label_for id
                  ; a_class
                      [ (if show_label then
                           "block text-sm font-medium leading-5 text-gray-700"
                        else
                          "sr-only")
                      ]
                  ]
                (match l with Some l -> [ txt l ] | None -> [])
            ; span
                ~a:[ a_class [ "text-sm leading-5 text-gray-500" ] ]
                [ txt hint ]
            ]
        | None ->
          label
            ~a:
              [ a_label_for id
              ; a_class
                  [ (if show_label then
                       "block text-sm font-medium leading-5 text-gray-700"
                    else
                      "sr-only")
                  ]
              ]
            (match l with Some l -> [ txt l ] | None -> []))
      ; div
          ~a:
            [ a_class
                [ ("relative rounded-md shadow-sm"
                  ^
                  if show_label then
                    " mt-1"
                  else
                    "")
                ]
            ]
          [ input
              ~a:
                ([ a_id id
                 ; a_input_type type_
                 ; a_class [ "form-input block w-full sm:text-sm sm:leading-5" ]
                 ]
                @ (match ph with Some ph -> [ a_placeholder ph ] | None -> [])
                @ (match name with Some name -> [ a_name name ] | None -> [])
                @ if required then [ a_required () ] else [])
              ()
          ]
      ; (match help with
        | Some help ->
          p
            ~a:
              [ a_class [ "mt-2 text-sm text-gray-500" ]
              ; a_id (id ^ "-description")
              ]
            [ txt help ]
        | None ->
          div [])
      ]

  let make
      ~id ?label ?name ?show_label ?placeholder ?type_ ?required ?help ?hint ()
    =
    createElement
      ~id
      ?label
      ?name
      ?show_label
      ?placeholder
      ?type_
      ?required
      ?help
      ?hint
      ()
end
