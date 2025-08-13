# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).S

{ inputs, lib, config, pkgs, systemSettings, userSettings, ... }: {
	# Include the results of the hardware scan.
	imports = [ 
		./hardware/configuration.nix { inherit systemSettings; }
		./features.nix # enable flakes here
		./permitted-insecure.nix # list of any insecure packages we wanna add
		./garbage-collection.nix # settings for automatic generation garbage collection 
		(./. + "../../system/packages/window-manager/${userSettings.windowManager}.nix")
		./packages/mullvad.nix # get me the fuck out of the uk
		./packages/steam.nix # who out here gaymin
		./packages/stylix.nix # for theming stuff
	];

	# Define your hostname.
	networking.hostName = "${systemSettings.hostname}";
	networking.networkmanager.enable = true;

	# Set your time zone.
	time.timeZone = "${systemSettings.timezone}";

	# Select internationalisation properties.
	i18n.defaultLocale = "${systemSettings.locale}";

	# Define a user account. Don't forget to set a password with ‘passwd’.
	users.users."${userSettings.username}" = {
		isNormalUser = true;
		description = "${userSettings.name}";
		extraGroups = [ "networkmanager" "wheel" "input" "dialout" "video" "render" ];
	};
	nix.settings.trusted-users = [ "@wheel" ];

	# Allow unfree packages
	nixpkgs.config.allowUnfree = true;

	services.devmon.enable = true;

	# List packages installed in system profile. To search, run:
	# $ nix search wget
	environment = {
		systemPackages = with pkgs; [ wget zsh git home-manager finalmouse-udev-rules liquidctl ];
		# shells = with pkgs [ zsh ];
	};

	users.defaultShell = pkgs.zsh;
	programs.zsh.enable = true;

	fonts.fontDir.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

	# This value determines the NixOS release from which the default
	# settings for stateful data, like file locations and database versions
	# on your system were taken. It‘s perfectly fine and recommended to leave
	# this value at the release version of the first install of this system.
	# Before changing this value read the documentation for this option
	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "25.05"; # Did you read the comment?

}
