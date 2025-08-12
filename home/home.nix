{ config, pkgs, userSettings ... }: {
	home.username = userSettings.username;
	home.directory = "/home/${userSettings.username}";

	programs.home-manager.enable = true;

	imports = [
		../system/packages/window-manager/${userSettings.windowManager}.nix
		./packages/sh.nix # shell config
		./packages/language-servers.nix # support for some languages
	];

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		zsh
		ffmpeg w3m mediainfo libmediainfo hwinfo pciutils shared-mime-info glib remmina sshfs texinfo libffi zlib ventoy wine bottles nmap
    gnome.adwaita-icon-theme gnome.nautilus gnome.gnome-calendar gnome.seahorse gnome.gnome-maps gnome.cheese audio-recorder
		libreoffice openboard newsflash gimp krita vlc blender-hip libresprite kdenlive obs-studio qbittorrent discord spotify vscodium
	];
}
