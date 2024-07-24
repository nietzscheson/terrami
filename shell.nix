{ pkgs ? import <nixpkgs> {} }:

let
  pythonEnv = pkgs.python311.withPackages (ps: [
    ps.pip
    ps.debugpy
    ps.ipython
  ]);
in

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    cmake
    poetry
    jq
    tree
  ];

  buildInputs = with pkgs; [
    terraform
    packer
    pythonEnv
  ];

  packages = with pkgs; [
    git
    python311
    awscli
    httpie
    go-task
    ansible
  ];

  shellHook = ''
    pyenv global system
    export PATH=$PATH:${pythonEnv}/bin
    export LC_ALL="C.UTF-8"
  '';
}