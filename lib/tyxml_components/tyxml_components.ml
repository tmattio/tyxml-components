module Make (Tyxml : Tyxml_sigs.S) = struct
  module Alert = Alert.Make (Tyxml)
  module Input = Input.Make (Tyxml)
  module Progress_bar = Progress_bar.Make (Tyxml)

  let alert = Alert.make

  let input = Input.make

  let progress_bar = Progress_bar.make
end

module Tyxml_impl = struct
  include Tyxml

  module Html = struct
    include Html
    module Svg = Svg
  end
end

module Vdom_impl = struct
  include Virtual_dom.Tyxml

  module Html = struct
    include Html
    module Svg = Svg
  end
end

module Tyxml = Make (Tyxml_impl)
module Vdom = Make (Vdom_impl)
include Tyxml
