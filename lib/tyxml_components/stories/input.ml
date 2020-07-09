open Incr_dom.Tyxml.Html
open Tyxml_components.Vdom

let view =
  div
    ~a:[ a_class [ "space-y-6" ] ]
    [ Tyxml_stories.Component.make
        ~title:"Text input"
        ~code:
          {|
Tyxml_components.input
  ~id:"username"
  ~name:"username"
  ~label:"Username"
  ~type_:`Text
  ~required:true
  ()
|}
        (div
           ~a:[ a_class [ "p-4" ] ]
           [ input
               ~id:"username"
               ~name:"username"
               ~label:"Username"
               ~type_:`Text
               ~required:true
               ()
           ])
    ; Tyxml_stories.Component.make
        ~title:"Email input"
        ~code:
          {|
Tyxml_components.input
  ~id:"email"
  ~name:"email"
  ~label:"Email"
  ~type_:`Email
  ~required:true
  ()
|}
        (div
           ~a:[ a_class [ "p-4" ] ]
           [ input
               ~id:"email"
               ~name:"email"
               ~label:"Email"
               ~type_:`Email
               ~required:true
               ()
           ])
    ; Tyxml_stories.Component.make
        ~title:"Password input"
        ~code:
          {|
Tyxml_components.input
  ~id:"password"
  ~name:"password"
  ~label:"Password"
  ~type_:`Password
  ~required:true
  ()
|}
        (div
           ~a:[ a_class [ "p-4" ] ]
           [ input
               ~id:"password"
               ~name:"password"
               ~label:"Password"
               ~type_:`Password
               ~required:true
               ()
           ])
    ]

let () = Tyxml_stories.add ~name:"Input" ~url:"/input" view
