{ lib, pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      home-manager
      gh
      nil
      nixpkgs-fmt
    ];

    username = "chandler";
    homeDirectory = "/home/chandler";

    stateVersion = "23.11";
  };

  programs = {
    zsh = {
      enable = true;
    };

    tmux = import ./tmux.nix pkgs;

    helix = import ./helix.nix;
  };
}
