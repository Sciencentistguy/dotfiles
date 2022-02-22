{ pkgs, lib, ... }:
{
  imports = [
    ./packages.nix
    ./overrides.nix
    ./neovim.nix
    ./linux-only.nix

    # comment this out to stop segfault
    ./default.nix
  ];
}
