let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.4-20221129/packages.dhall

let packages =
        ./purescript-d3.dhall
      ⫽ ./purescript-dom-simple.dhall
      ⫽ ./purescript-ffi-simple.dhall
      ⫽ ./purescript-formula.dhall
      ⫽ ./purescript-reactix.dhall
      ⫽ ./purescript-simplecrypto.dhall
      ⫽ ./purescript-toestand.dhall
      ⫽ ./purescript-typisch.dhall
      ⫽ ./spec-mocha.dhall

in  upstream ⫽ packages
