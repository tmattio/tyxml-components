open Incr_dom.Tyxml.Html
open Tyxml_components.Vdom

let simple =
  Tyxml_stories.Component.make
    ~title:"Simple progress bar"
    ~code:
      {|
Tyxml_components.progress_bar ~label:"A" ~percentage:90 ~color:`purple
|}
    (div
       ~a:[ a_class [ "p-4" ] ]
       [ progress_bar ~label:"A" ~percentage:90 ~color:`green ])

let view = div [ simple ]

let () = Tyxml_stories.add ~name:"Progress Bar" ~url:"/progress-bar" view
