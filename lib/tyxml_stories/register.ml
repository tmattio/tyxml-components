type component =
  { name : string
  ; url : string
  ; view : Html_types.div_content_fun Incr_dom.Tyxml.Html.elt
  }

let stories : (string, component) Hashtbl.t = Hashtbl.create 1

let add ~name ~url view = Hashtbl.add stories url { name; url; view }

let get_by_url url = Hashtbl.find_opt stories url

let all () =
  Hashtbl.to_seq stories
  |> List.of_seq
  |> ListLabels.map ~f:snd
  |> ListLabels.sort ~cmp:(fun cmp1 cmp2 -> String.compare cmp1.name cmp2.name)
