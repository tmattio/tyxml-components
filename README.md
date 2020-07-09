# Tyxml Components

[![Actions Status](https://github.com/tmattio/tyxml-components/workflows/CI/badge.svg)](https://github.com/tmattio/tyxml-components/actions)

Components for Tyxml, built with TailwindCSS and AlpineJS.

This repository provides two libraries:

- `tyxml-stories`- A library to build component explorers for your components.
- `tyxml-components` - A small set of reusable UI components built with TailwindCSS and AlpineJS

The primary purpose of `tyxml-components` is to offer reusable UI components for your backend. If you have a backend with some HTML generated with Tyxml.

The second purpose is to mimic a typical frontend development workflow when you are building server-side rendered applications. By typical workflow, I mean that the UI components are extracted in a component library / design system, and its development is done separately from the application development.

`tyxml-components` itself makes use of `tyxml-stories`, you can see the generated component explorer [here](https://github.com/tmattio/tyxml-components/).


## Using `tyxml-components`

Install it with:

```
opam install tyxml-components
```

And use the components in your application:

```ocaml
div [
    Tyxml_components.alert (`error "An error occured while processing your request.")
]
```

## Using `tyxml-stories`

Install it with:

```
opam install tyxml-stories
```

To build your own component explorer, you can first copy the `asset/` directory in your application. It provides the JS setup and static content needed to create a SPA application for the component explorer.

Then you can create a "binary" file that starts your application:

```ocaml
let () = Tyxml_stories.start ()
```

And configure dune to compile as Javascript:


```
(library
 (name my_component_stories)
 (libraries tyxml tyxml_stories tyxml_components)
 (modules (:standard \ main))
 (flags
  (:standard -linkall)))

(executable
 (name main)
 (libraries my_component_stories)
 (modes js))
```

A typical story looks like this:

```ocaml
open Incr_dom.Tyxml.Html
open Tyxml_components.Vdom

let view =
  Tyxml_stories.Component.make
    ~title:"My story component"
    ~code:
      {|
The demo code goes here.
|}
    (div
       ~a:[ a_class [ "space-y-6 p-4" ] ]
       [ p [ txt "Hello world" ] ])

let () = Tyxml_stories.add ~name:"My story" ~url:"/hello-world" view
```

## Contributing

Take a look at our [Contributing Guide](CONTRIBUTING.md).
