{ config, pkgs, inputs, ... }: {
  home.packages = with pkgs; [
    neovim neovim-remote neovide
  ];
}