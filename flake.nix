# https://github.dev/Misterio77/nix-starter-configs
{
	description = "Uloncls NixOS configuration with Flakes and Home Manager";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
		
		home-manager = {
			url = "github:nix-community/home-manager/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		hyprland = { # base hyprland window manager
			url = "github:hyprwm/Hyprland/v0.50.1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprlock = { # hyprland lock screen manager
			url = "github:hyprwm/Hyprlock/v0.9.1";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		hyprland-plugins = { # plugins for hyprland
			url = "github:hyprwm/Hyprland-plugins/v0.50.0";
			inputs.nixpkgs.follows = "hyprland";
		};

		stylix = { # stylix for automatically loading themes
			url = "github:nix-community/stylix/release-25.05";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# import-tree = { # import tree for automatically importing all nix files under a directory
		# 	url = "github:vic/import-tree";
		# 	inputs.nixpkgs.follows = "nixpkgs";
		# };

    zen-browser = { # a better browser ill setup later
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
	};

	outputs = { self, nixpkgs, home-manager, ... } @ inputs: let 
		systemSettings = {
			system = "x86_64-linux";
			hostname = "kircheis"; # LOTGH reference go watch
			profile = "personal";
			timezone = "Europe/Isle_of_Man";
			locale = "en_GB.UTF-8";
		};

		userSettings = {
			username = "uloncl";
			name = "Uloncl";
			email = "nebulous7554@gmail.com";
			dotfilesDir = "~/.config";
			theme = ""; # once we figure that out and probably make our own
			windowManager = "hyprland";
			windowManagerType = "wayland";
			browser = "firefox"; # preferably arc browser but might be more complex to setup
			font = "Hurmit"; # not totally sure might go for a pixelated one idk https://www.nerdfonts.com/font-downloads
			fontPkg = pkgs.nerd-fonts.hurmit;
			# editor = "nano"; # im assuming cmd editor and idk if were gonna go back to neovim
		};

		pkgs = import inputs.nixpkgs {
			system = systemSettings.system;
			config = {
				allowUnfree = true;
				allowUnfreePredicate = (_: true);
			};
		};

		home-manager = inputs.home-manager-stable;
	in {
		nixosConfigurations = {
			system = inputs.nixpkgs.lib.nixosSystem {
				system = systemSettings.system;
				modules = [./system/configuration.nix];
				specialArgs = {
					inherit systemSettings;
					inherit userSettings;
					inherit pkgs;
					inherit home-manager;
					inherit inputs;
				};
			};
		};

		homeConfigurations = {
			user = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [./home/home.nix];
				extraSpecialArgs = {
					inherit systemSettings;
					inherit userSettings;
					inherit pkgs;
					inherit home-manager;
					inherit inputs;
				};
			};
		};
	};
}
