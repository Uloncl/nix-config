{ pkgs, ... }: {
  home.packages = with pkgs; [ gotenberg libreoffice openboard ];

  services = { 
    gotenberg = {
      enable = true;
    };
  };
}