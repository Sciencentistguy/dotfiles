{
  description = "Jamie's darwin system";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, darwin, nixpkgs }: {
    darwinConfigurations."discordia" = darwin.lib.darwinSystem {
      system = "x86_64-darwin";
      modules = [ ./configuration.nix ];
    };
  };
}
