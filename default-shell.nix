# default shell for most purescript projects

let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/21.11.tar.gz";
    sha256 = "162dywda2dvfj1248afxc45kcrg83appjd0nmdb541hl7rnncf02";
  }) {};
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "master";
      sha256 = "03g9xq451dmrkq8kiz989wnl8k0lmj60ajflz44bhp7cm08hf3bw";
    }
  ) {
    inherit pkgs;
  };

  build = pkgs.writeShellScriptBin "build" ''
    #!/usr/bin/env bash
    purs compile "src/**/*.purs" "test/**/*.purs"
  '';
in
pkgs.mkShell {
  name = "purescript-reactix";

  buildInputs = [
    easy-ps.purs-0_15_4
    easy-ps.psc-package
    easy-ps.spago
    build
    pkgs.dhall-json
  ];
}
