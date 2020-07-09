module type S = sig
  module Xml : Tyxml_f.Xml_sigs.NoWrap

  module Svg : Tyxml_f.Svg_sigs.NoWrap

  module Html : Tyxml_f.Html_sigs.NoWrap
end
