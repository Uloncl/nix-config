{ pkgs, ... }: {
  home.packages = with pkgs; [ qbittorrent ];
  
  programs.qbittorrent = {
    enable = true;
    openFirewall = true;
  };
}