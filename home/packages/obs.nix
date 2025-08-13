{ pkgs, ... }: {
  home.packages = with pkgs; [ obs-studio ];
  
  programs.obs-studio.enableVirtualCamera = true;

  home-manager.users.uloncl.programs.obs-studio = {
    enable = true;
    plugins = []; # https://mynixos.com/search?q=obs-studio-plugins
  };
}