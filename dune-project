(lang dune 2.0)

(name tyxml-components)

(documentation "https://tmattio.github.io/tyxml-components/")

(source
 (github tmattio/tyxml-components))

(license MIT)

(authors "Thibaut Mattio")

(maintainers "Thibaut Mattio")

(generate_opam_files true)

(package
 (name tyxml-components)
 (synopsis "Components for Tyxml, built with TailwindCSS and AlpineJS")
 (description "Components for Tyxml, built with TailwindCSS and AlpineJS.")
 (depends
  (ocaml
   (>= 4.08.0))
  (dune
   (>= 2.0))
  (alcotest :with-test)
  (odoc :with-doc)))

(package
 (name tyxml-stories)
 (synopsis "Storybook for Tyxml components")
 (description "Storybook for Tyxml components.")
 (depends
  (ocaml
   (>= 4.08.0))
  (dune
   (>= 2.0))
  (alcotest :with-test)
  (odoc :with-doc)))
