let make
    ~(components : Register.component list) (component : Register.component)
  =
  let open Incr_dom.Tyxml in
  let open Incr_dom.Tyxml.Html in
  let a_custom x y = Xml.string_attrib x y |> to_attrib in
  let a_svg_custom x y = Xml.string_attrib x y |> Svg.to_attrib in
  div
    ~a:
      [ a_id component.name
      ; a_style "min-height: 640px"
      ; a_class [ "bg-gray-100" ]
      ]
    [ div
        ~a:
          [ a_class [ "h-screen flex overflow-hidden bg-gray-100" ]
          ; a_custom "x-data" "{ sidebarOpen: false }"
          ; a_custom "x-on:keydown.window.escape" "sidebarOpen = false"
          ]
        [ div
            ~a:
              [ a_custom "x-show" "sidebarOpen"
              ; a_class [ "md:hidden" ]
              ; a_style "display: none;"
              ]
            [ div
                ~a:[ a_class [ "fixed inset-0 flex z-40" ] ]
                [ div
                    ~a:
                      [ a_custom "x-show" "sidebarOpen"
                      ; a_custom "x-on:click" "sidebarOpen = false"
                      ; a_custom
                          "x-description"
                          "Off-canvas menu overlay, show/hide based on \
                           off-canvas menu state."
                      ; a_custom
                          "x-transition:enter"
                          "transition-opacity ease-linear duration-300"
                      ; a_custom "x-transition:enter-start" "opacity-0"
                      ; a_custom "x-transition:enter-end" "opacity-100"
                      ; a_custom
                          "x-transition:leave"
                          "transition-opacity ease-linear duration-300"
                      ; a_custom "x-transition:leave-start" "opacity-100"
                      ; a_custom "x-transition:leave-end" "opacity-0"
                      ; a_class [ "fixed inset-0" ]
                      ; a_style "display: none;"
                      ]
                    [ div
                        ~a:
                          [ a_class
                              [ "absolute inset-0 bg-gray-600 opacity-75" ]
                          ]
                        []
                    ]
                ; div
                    ~a:
                      [ a_custom "x-show" "sidebarOpen"
                      ; a_custom
                          "x-description"
                          "Off-canvas menu, show/hide based on off-canvas menu \
                           state."
                      ; a_custom
                          "x-transition:enter"
                          "transition ease-in-out duration-300 transform"
                      ; a_custom "x-transition:enter-start" "-translate-x-full"
                      ; a_custom "x-transition:enter-end" "translate-x-0"
                      ; a_custom
                          "x-transition:leave"
                          "transition ease-in-out duration-300 transform"
                      ; a_custom "x-transition:leave-start" "translate-x-0"
                      ; a_custom "x-transition:leave-end" "-translate-x-full"
                      ; a_class
                          [ "relative flex-1 flex flex-col max-w-xs w-full \
                             bg-gray-800"
                          ]
                      ; a_style "display: none;"
                      ]
                    [ div
                        ~a:[ a_class [ "absolute top-0 right-0 -mr-14 p-1" ] ]
                        [ button
                            ~a:
                              [ a_custom "x-show" "sidebarOpen"
                              ; a_custom "x-on:click" "sidebarOpen = false"
                              ; a_class
                                  [ "flex items-center justify-center h-12 \
                                     w-12 rounded-full focus:outline-none \
                                     focus:bg-gray-600"
                                  ]
                              ; a_aria "label" [ "Close sidebar" ]
                              ; a_style "display: none;"
                              ]
                            [ svg
                                ~a:
                                  [ Svg.a_class [ "h-6 w-6 text-white" ]
                                  ; Svg.a_stroke `CurrentColor
                                  ; Svg.a_fill `None
                                  ; Svg.a_viewBox (0., 0., 24., 24.)
                                  ]
                                [ Svg.path
                                    ~a:
                                      [ a_svg_custom "stroke-linecap" "round"
                                      ; a_svg_custom "stroke-linejoin" "round"
                                      ; a_svg_custom "stroke-width" "2"
                                      ; Svg.a_d "M6 18L18 6M6 6l12 12"
                                      ]
                                    []
                                ]
                            ]
                        ]
                    ; div
                        ~a:
                          [ a_class [ "flex-1 h-0 pt-5 pb-4 overflow-y-auto" ] ]
                        [ div
                            ~a:
                              [ a_class
                                  [ "flex-shrink-0 flex items-center px-4" ]
                              ]
                            [ h1
                                ~a:
                                  [ a_class
                                      [ "text-white text-bold leading-5 \
                                         text-2xl"
                                      ]
                                  ]
                                [ txt "Components" ]
                            ]
                        ; nav
                            ~a:[ a_class [ "mt-5 px-2" ] ]
                            (List.map
                               components
                               ~f:(fun (cmp : Register.component) ->
                                 a
                                   ~a:
                                     [ a_href ("#" ^ cmp.url)
                                     ; a_class
                                         ([ "group flex items-center mt-2 \
                                             first:mt-0 px-2 py-2 text-base \
                                             leading-6 font-medium rounded-md \
                                             text-white ocus:outline-none \
                                             focus:bg-gray-700 \
                                             hover:bg-gray-700 transition \
                                             ease-in-out duration-150"
                                          ]
                                         @
                                         if String.equal cmp.url component.url
                                         then
                                           [ " bg-gray-700" ]
                                         else
                                           [])
                                     ]
                                   [ txt cmp.name ]))
                        ]
                    ]
                ; div ~a:[ a_class [ "flex-shrink-0 w-14" ] ] []
                ]
            ]
        ; div
            ~a:[ a_class [ "hidden md:flex md:flex-shrink-0" ] ]
            [ div
                ~a:[ a_class [ "flex flex-col w-64 bg-gray-800" ] ]
                [ div
                    ~a:
                      [ a_class
                          [ "h-0 flex-1 flex flex-col pt-5 pb-4 overflow-y-auto"
                          ]
                      ]
                    [ div
                        ~a:
                          [ a_class [ "flex items-center flex-shrink-0 px-4" ] ]
                        [ h1
                            ~a:
                              [ a_class
                                  [ "text-white font-bold leading-5 text-2xl" ]
                              ]
                            [ txt "Components" ]
                        ]
                    ; nav
                        ~a:[ a_class [ "mt-5 flex-1 px-2 bg-gray-800" ] ]
                        (List.map
                           components
                           ~f:(fun (cmp : Register.component) ->
                             a
                               ~a:
                                 [ a_href ("#" ^ cmp.url)
                                 ; a_class
                                     ([ "group flex items-center mt-2 \
                                         first:mt-0 px-2 py-2 text-sm \
                                         leading-5 font-medium text-white \
                                         rounded-md focus:outline-none \
                                         focus:bg-gray-700 hover:bg-gray-700 \
                                         transition ease-in-out duration-150"
                                      ]
                                     @
                                     if String.equal cmp.url component.url then
                                       [ " bg-gray-700" ]
                                     else
                                       [])
                                 ]
                               [ txt cmp.name ]))
                    ]
                ]
            ]
        ; div
            ~a:[ a_class [ "flex flex-col w-0 flex-1 overflow-hidden" ] ]
            [ div
                ~a:[ a_class [ "md:hidden pl-1 pt-1 sm:pl-3 sm:pt-3" ] ]
                [ button
                    ~a:
                      [ a_class
                          [ "-ml-0.5 -mt-0.5 h-12 w-12 inline-flex \
                             items-center justify-center rounded-md \
                             text-gray-500 hover:text-gray-900 \
                             focus:outline-none focus:bg-gray-200 transition \
                             ease-in-out duration-150"
                          ]
                      ; a_aria "label" [ "Open sidebar" ]
                      ; a_custom "x-on:click.stop" "sidebarOpen = true"
                      ]
                    [ svg
                        ~a:
                          [ Svg.a_class [ "h-6 w-6" ]
                          ; Svg.a_fill `None
                          ; Svg.a_viewBox (0., 0., 24., 24.)
                          ; Svg.a_stroke `CurrentColor
                          ]
                        [ Svg.path
                            ~a:
                              [ a_svg_custom "stroke-linecap" "round"
                              ; a_svg_custom "stroke-linejoin" "round"
                              ; a_svg_custom "stroke-width" "2"
                              ; Svg.a_d "M4 6h16M4 12h16M4 18h16"
                              ]
                            []
                        ]
                    ]
                ]
            ; main
                ~a:
                  [ a_class
                      [ "flex-1 relative z-0 overflow-y-auto focus:outline-none"
                      ]
                  ; a_tabindex 0
                  ; a_custom "x-data" ""
                  ; a_custom "x-init" "$el.focus()"
                  ]
                [ div
                    ~a:[ a_class [ "pt-2 pb-6 md:py-6" ] ]
                    [ div
                        ~a:
                          [ a_class [ "max-w-7xl mx-auto px-4 sm:px-6 lg:px-8" ]
                          ]
                        [ h2
                            ~a:
                              [ a_class
                                  [ "text-2xl font-semibold text-gray-900" ]
                              ]
                            [ txt component.name ]
                        ]
                    ; div
                        ~a:
                          [ a_class [ "max-w-7xl mx-auto px-4 sm:px-6 md:px-8" ]
                          ]
                        [ div ~a:[ a_class [ "py-4" ] ] [ component.view ] ]
                    ]
                ]
            ]
        ]
    ]
