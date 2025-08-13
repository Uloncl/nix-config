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
  home.packages = with pkgs; [ 
    zsh bash
    pywal cava
    direnv nix-direnv bat eza bottom fd unzip
    libnotify timer
    vim neovim
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.bash = {
    enable = true;
  };

  programs.direnv.enable = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}