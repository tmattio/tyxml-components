let make ~title:title_ ~code:code_ child =
  let open Incr_dom.Tyxml in
  let open Incr_dom.Tyxml.Html in
  let a_custom x y = Xml.string_attrib x y |> to_attrib in
  let a_svg_custom x y = Xml.string_attrib x y |> Svg.to_attrib in
  div
    ~a:
      [ a_custom "x-data" "{ activeTab: 'preview', activeSnippet: 'html' }"
      ; a_class [ "border border-gray-200 rounded-lg overflow-hidden" ]
      ]
    [ div
        ~a:
          [ a_class
              [ "px-4 py-2 border-b border-gray-200 flex justify-between \
                 items-center bg-white sm:py-4 sm:px-6 sm:items-baseline"
              ]
          ]
        [ div
            ~a:[ a_class [ "flex items-center" ] ]
            [ h3
                ~a:
                  [ a_class
                      [ "font-regular text-base md:text-lg leading-snug \
                         truncate"
                      ]
                  ]
                [ a [ txt title_ ] ]
            ]
        ; div
            ~a:[ a_class [ "ml-4 flex flex-shrink-0 items-center" ] ]
            [ div
                ~a:[ a_class [ "flex items-center text-sm sm:hidden" ] ]
                [ button
                    ~a:
                      [ a_button_type `Button
                      ; a_custom
                          "x-on:click"
                          "activeTab === 'preview' ? (activeTab = 'code') : \
                           (activeTab = 'preview')"
                      ; a_custom
                          ":class"
                          "{'bg-gray-100 text-gray-700': activeTab === \
                           'code', 'text-gray-400 hover:text-gray-600 \
                           focus:text-gray-600': activeTab !== 'code'}"
                      ; a_class
                          [ "inline-block rounded-lg font-medium leading-none \
                             py-3 px-3 focus:outline-none text-gray-400 \
                             hover:text-gray-600 focus:text-gray-600"
                          ]
                      ]
                    [ svg
                        ~a:
                          [ Svg.a_class [ "h-5 w-5" ]
                          ; Svg.a_fill `CurrentColor
                          ; Svg.a_viewBox (0., 0., 20., 20.)
                          ]
                        [ Svg.path
                            ~a:
                              [ a_svg_custom "fill-rule" "evenodd"
                              ; Svg.a_d
                                  "M12.316 3.051a1 1 0 01.633 1.265l-4 12a1 1 \
                                   0 11-1.898-.632l4-12a1 1 0 \
                                   011.265-.633zM5.707 6.293a1 1 0 010 \
                                   1.414L3.414 10l2.293 2.293a1 1 0 11-1.414 \
                                   1.414l-3-3a1 1 0 010-1.414l3-3a1 1 0 \
                                   011.414 0zm8.586 0a1 1 0 011.414 0l3 3a1 1 \
                                   0 010 1.414l-3 3a1 1 0 \
                                   11-1.414-1.414L16.586 10l-2.293-2.293a1 1 0 \
                                   010-1.414z"
                              ; a_svg_custom "clip-rule" "evenodd"
                              ]
                            []
                        ]
                    ]
                ]
            ; div
                ~a:
                  [ a_class
                      [ "hidden sm:flex items-center text-sm md:text-base" ]
                  ]
                [ button
                    ~a:
                      [ a_button_type `Button
                      ; a_custom "x-on:click" "activeTab = 'preview'"
                      ; a_custom
                          ":class"
                          "{'bg-gray-100 text-gray-700': activeTab === \
                           'preview', 'text-gray-500 hover:text-gray-600 \
                           focus:text-gray-600': activeTab !== 'preview'}"
                      ; a_class
                          [ "inline-block rounded-lg font-medium leading-none \
                             py-2 px-3 focus:outline-none bg-gray-100 \
                             text-gray-700"
                          ]
                      ]
                    [ txt "Preview" ]
                ; button
                    ~a:
                      [ a_button_type `Button
                      ; a_custom "x-on:click" "activeTab = 'code'"
                      ; a_custom
                          ":class"
                          "{'bg-gray-100 text-gray-700': activeTab === \
                           'code', 'text-gray-500 hover:text-gray-600 \
                           focus:text-gray-600': activeTab !== 'code'}"
                      ; a_class
                          [ "ml-2 inline-block rounded-lg font-medium \
                             leading-none py-2 px-3 focus:outline-none \
                             text-gray-500 hover:text-gray-600 \
                             focus:text-gray-600"
                          ]
                      ]
                    [ txt "Code" ]
                ]
            ]
        ]
    ; div
        ~a:[ a_class [ "relative bg-gray-1000" ] ]
        [ div
            ~a:
              [ a_custom
                  ":class"
                  "{ 'block': activeTab === 'preview', 'hidden': activeTab !== \
                   'preview' }"
              ; a_class [ "block" ]
              ]
            [ div ~a:[ a_class [ "w-full bg-white" ] ] [ child ] ]
        ; div
            ~a:
              [ a_custom
                  ":class"
                  "{ 'block': activeTab === 'code', 'hidden': activeTab !== \
                   'code' }"
              ; a_class [ "hidden" ]
              ]
            [ pre
                ~a:
                  [ a_custom
                      ":class"
                      "{'block': activeSnippet === 'html', 'hidden': \
                       activeSnippet !== 'html' }"
                  ; a_class
                      [ " block scrollbar-none m-0 p-0 overflow-auto \
                         text-white text-sm bg-gray-800 leading-normal"
                      ]
                  ]
                [ code
                    ~a:[ a_class [ "language-ocaml" ] ]
                    [ txt (String.trim code_) ]
                ]
            ]
        ]
    ]
