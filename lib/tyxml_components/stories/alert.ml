open Incr_dom.Tyxml.Html
open Tyxml_components.Vdom

let view =
  Tyxml_stories.Component.make
    ~title:"Simple alerts"
    ~code:
      {|
Tyxml_components.alert (`error "An error occured while processing your request.")

Tyxml_components.alert (`success "Your email has been updated successfully.")

Tyxml_components.alert (`warning "You need to confirm your email.")

Tyxml_components.alert (`info "One of your dataset has a new suggestion.")
|}
    (div
       ~a:[ a_class [ "space-y-6 p-4" ] ]
       [ alert (`error "An error occured while processing your request.")
       ; alert (`success "Your email has been updated successfully.")
       ; alert (`warning "You need to confirm your email.")
       ; alert (`info "One of your dataset has a new suggestion.")
       ])

let () = Tyxml_stories.add ~name:"Alert" ~url:"/alert" view
