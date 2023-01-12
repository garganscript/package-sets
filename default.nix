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

  easy-dhall = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-dhall-nix";
      rev = "master";
      sha256 = "jjEqfh+M73+t2Iq/IKjAGr2d2kGUeo9A7Wu7V0IxdzI=";
    }
  ) {
    inherit pkgs;
  };

  purs = easy-ps.purs-0_15_7;

in
pkgs.runCommand "easy-ps-test" {
  buildInputs =
    builtins.attrValues {
      inherit (easy-ps) psc-package spago;
    } ++
    builtins.attrValues {
      inherit (easy-dhall) dhall-simple dhall-json-simple;
    } ++
    [ pkgs.git pkgs.wget pkgs.jq purs ];
} ""
