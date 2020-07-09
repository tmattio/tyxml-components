type component =
  { name : string
  ; url : string
  ; view : Html_types.div_content_fun Incr_dom.Tyxml.Html.elt
  }

val add
  :  name:string
  -> url:string
  -> Html_types.div_content_fun Incr_dom.Tyxml.Html.elt
  -> unit

val get_by_url : string -> component option

val all : unit -> component list
