module Component = Component

val start : unit -> unit

val add
  :  name:string
  -> url:string
  -> Html_types.div_content_fun Incr_dom.Tyxml.Html.elt
  -> unit
