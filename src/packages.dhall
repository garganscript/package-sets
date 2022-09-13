let upstream =
      https://github.com/purescript/package-sets/releases/download/psc-0.15.0-20220510/packages.dhall
        sha256:0b0d4db1f2f0acd3b37fa53220644ac6f64cf9b5d0226fd097c0593df563d5be

let packages =
        ./purescript-dom-simple.dhall
      ⫽ ./purescript-ffi-simple.dhall
      ⫽ ./purescript-formula.dhall
      ⫽ ./purescript-reactix.dhall
      ⫽ ./purescript-toestand.dhall
      ⫽ ./purescript-typisch.dhall
      ⫽ ./spec-mocha.dhall

in  upstream ⫽ packages
