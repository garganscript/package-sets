# default shell for most purescript projects

let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/22.05.tar.gz";
    sha256 = "00fvy8rv1wq1qya8fwbm2p4zxbhgr14x0z3rcibgl4b6791jb30g";
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
