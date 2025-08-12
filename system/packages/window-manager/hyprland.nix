{ inputs, pkgs, lib, ... }: let 
  pkgs-hyprland = inputs.hyprland.inputs.nixpkgs.legacypackages;
in {
  imports = [
    ./wayland.nix
    ./pipewire.nix
    ./dbus.nix
  ];

  security.pam.services.login.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  services.xserver = {
    excludePackages = [ pkgs.xterm ];
    displayManager.gdm = {
      enable = true;
      wayland = true;
    }
  }
}