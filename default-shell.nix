# default shell for most purescript projects

let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/22.11.tar.gz";
  }) {};
  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "master";
      sha256 = "tESal32bcqqdZO+aKnBzc1GoL2mtnaDtj2y7ociCRGA=";
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
  purs = easy-ps.purs-0_15_7;
}
