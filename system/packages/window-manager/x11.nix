{...}: {
    services.xserver = {
        enable = true;
        desktopManager.gnome.enable = true;
        videoDrivers = [ "nvidia" ];
        xkb.layout = "us";
    };
}