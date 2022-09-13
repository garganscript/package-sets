# garganscript package-sets

This is a custom package-sets to incorporate our growing number of
libraries.

To use it just add this to your `packages.dhall` file:
```dhall
let upstream =
      https://github.com/garganscript/package-sets/releases/download/v0.1.2/release.dhall
        sha256:9ea93c613a9981c5a573ddee3fa4c63914040c6b4aeeeeaf4cbe43cf682cb38d
```

## Adding new libraries

Just edit `src/packages.dhall` file and add a new dependency. Please
remember to verify your libs after that:

```sh
cd src
spago verify-set
```

## `default-shell.nix`

Since we like nix, you can add something like this as `shell.nix`
script to your repo to match our up-to-date PS version:

```nix
let
  pkgs = import <nixpkgs> {};
  default-shell = import (
    pkgs.fetchFromGitHub {
      owner = "garganscript";
      repo = "package-sets";
      rev = "master";
      sha256 = "1z7x5g0ba62l6hiagwsmnmdg07mz5xwf35qvb9p7fry2lks1ma18";
    } + "/default-shell.nix");
in
pkgs.mkShell {
  name = "purescript-reactix";

  buildInputs = [
    default-shell.purs
    default-shell.easy-ps.psc-package
    default-shell.easy-ps.spago
    default-shell.build
    default-shell.pkgs.dhall-json
  ];
}
```
