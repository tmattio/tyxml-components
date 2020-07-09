open Incr_dom.Tyxml.Html

let view =
  Tyxml_stories.Component.make
    ~title:"My story component"
    ~code:{|
The demo code goes here.
|}
    (div ~a:[ a_class [ "space-y-6 p-4" ] ] [ p [ txt "Hello world" ] ])

let () = Tyxml_stories.add ~name:"My story" ~url:"/hello-world" view
