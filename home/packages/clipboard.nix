{ pkgs, ... }: {
  home.packages = with pkgs; [ wayclip cliphist ];
  
  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [ "-max-items" "20" ];
    systemdTargets = [ "graphical-session.target" "hyprland.target" ];
  }
}