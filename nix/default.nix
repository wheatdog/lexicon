with import <nixpkgs> {};

let
  dns-lexicon = with python3.pkgs; callPackage ./dns-lexicon { };
  py-env = python3.withPackages (ps: 
      with ps; [
          dns-lexicon
          pytest
          pytestcov
          pytest_xdist
          vcrpy
          mock
          flake8
          isort
          tox
          black
  ]);
in mkShell {
    buildInputs = [
        py-env
    ];
}
