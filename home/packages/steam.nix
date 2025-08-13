{ pkgs, ... }: {
  home.packages = with pkgs; [ steam gamemode ];

  programs.gamemode.enable = true;

  programs.steam = {
    enable = true;
    protontricks.enable = true;
    localNetworkGameTransfers.openFirewall = true;
  };
}