let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/22.05.tar.gz";
    sha256 = "0d643wp3l77hv2pmg2fi7vyxn4rwy0iyr8djcw1h5x72315ck9ik";
  }) {};

  easy-ps = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-purescript-nix";
      rev = "da7acb2662961fd355f0a01a25bd32bf33577fa8";
      sha256 = "/UOLRdnEhIOcxcm5ouOipOiSgHRzJde0ccAx4xB1dnU=";
    }
  ) {
    inherit pkgs;
  };

  easy-dhall = import (
    pkgs.fetchFromGitHub {
      owner = "justinwoo";
      repo = "easy-dhall-nix";
      rev = "dce9acbb99776a7f1344db4751d6080380f76f57";
      sha256 = "jjEqfh+M73+t2Iq/IKjAGr2d2kGUeo9A7Wu7V0IxdzI=";
    }
  ) {
    inherit pkgs;
  };

  purs = easy-ps.purs-0_15_4;

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
