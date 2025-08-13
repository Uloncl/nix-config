{ config, pkgs, ... }: {
  imports = [
    ./pipewire.nix
    ./dbus.nix
    ./gnome-keyring.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs;
    [ wayland waydroid
      (sddm-chili-theme.override {
        themeConfig = {
          background = ../../../backgronds/5120x1440/abed-ismail-cropped-v2.png;
          ScreenWidth = 5120;
          ScreenHeight = 1440;
          blur = true;
          recursiveBlurLoops = 3;
          recursiveBlurRadius = 5;
        };})
    ];

  # Configure xwayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
      options = "caps:escape";
    };
  };
}
