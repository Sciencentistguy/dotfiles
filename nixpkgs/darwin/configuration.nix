{ config, pkgs, lib, ... }:
let
  # This is cursed but it would appear that's just how flakes be
  neovim-nightly-pkgs = pkgs.callPackage
    (import
      (builtins.fetchTarball {
        url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
      })
      { }
    )
    { inherit (pkgs) system; };
  custompkgs = import ./custompkgs.nix { };
  overrides = pkgs.callPackage ./overrides.nix {
    inherit custompkgs neovim-nightly-pkgs;
    inherit (pkgs.stdenv) isDarwin;
  };
in
{
  imports = [ <home-manager/nix-darwin> ];

}
