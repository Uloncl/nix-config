{ config, pkgs, userSettings, inputs ... }: {
	home.username = userSettings.username;
	home.directory = "/home/${userSettings.username}";

	programs.home-manager.enable = true;

	imports = [
		../system/packages/window-manager/${userSettings.windowManager}.nix
		
		./packages/browsers.nix # browsers config
		./packages/clipboard.nix # clipboard config
		./packages/discord.nix # discord config
		./packages/fetch.nix # fastfetch one(git)fetch and starfetch config
		./packages/language-servers.nix # support for some languages
		# ./packages/nvim.nix # nvim config
		./packages/obs.nix # obs config
		./packages/office.nix # apps for pdfs and documents config
		./packages/qbittorrent.nix # qbittorrent config
		./packages/sh.nix # shell config
		./packages/steam.nix # steam config
		./packages/term.nix # terminal config
	];

	home.stateVersion = "25.05";

	home.packages = with pkgs; [
		ffmpeg w3m mediainfo libmediainfo hwinfo pciutils shared-mime-info glib remmina sshfs texinfo libffi zlib ventoy wine bottles nmap
		gnome.adwaita-icon-theme gnome.nautilus gnome.gnome-calendar gnome.seahorse gnome.cheese audio-recorder
		newsflash gimp krita vlc blender-hip libresprite kdenlive spotify vscodium filezilla
	];
}
