{ pkgs, ... }: let
  Aliases = {
    fetch = "fastfetch";
    neofetch = "fastfetch";
    gitfetch = "onefetch";
    cat = "bat";
    ls = "eza";
    htop = "btm";
  };
in {
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.bash = {
    enable = true;
  };

  home.packages = with pkgs; [ 
    fastfetch onefetch pywal starfetch cava
    direnv nix-direnv bat eza bottom fd unzip
    libnotify timer
    vim neovim
  ];

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}