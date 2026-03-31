{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    python313
    python313Packages.pip
    python313Packages.virtualenv
  ]);
  runScript = "zsh";
}).env
