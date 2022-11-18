# default shell for most purescript projects

let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/22.05.tar.gz";
    sha256 = "0d643wp3l77hv2pmg2fi7vyxn4rwy0iyr8djcw1h5x72315ck9ik";
  }) {};
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "master";
      sha256 = "/UOLRdnEhIOcxcm5ouOipOiSgHRzJde0ccAx4xB1dnU=";
    }
  ) {
    inherit pkgs;
  };

  build = pkgs.writeShellScriptBin "build" ''
    #!/usr/bin/env bash
    purs compile "src/**/*.purs" "test/**/*.purs"
  '';
in
{ build = build;
  easy-ps = easy-ps;
  pkgs = pkgs;
  purs = easy-ps.purs-0_15_4;
}
