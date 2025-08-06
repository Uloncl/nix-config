# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).S

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
  ];

  boot = {
    # Bootloader
    loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        devices = [ "nodev" ];
        gfxmodeEfi = "2560x1440";
        configurationLimit = 2;
      };
    };
  };

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Isle_of_Man";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  # Enable the GNOME Desktop Environment.
  services = {
    displayManager.defaultSession = "gnome";
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
      displayManager = {
        gdm = {
          enable = true;          
        };
      };
      desktopManager = {
        gnome = {
          enable = true;
        };
      };
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    gnome = {
      games.enable = false;
      core-apps.enable = false;
      core-developer-tools.enable = false;
    };
    mullvad-vpn.enable = true;
    printing = {
      enable = true;
      package = pkgs.symlinkJoin {
        inherit (pkgs.cups) name pname version meta;
        paths = [pkgs.cups];
        postBuild = ''
          unlink $out/share/applications/cups.desktop
        '';
      };
    };
    system-config-printer.enable = false;
    # Enable sound with pipewire.
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  security.rtkit.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.uloncl = {
    isNormalUser = true;
    description = "uloncl";
    extraGroups = [ "networkmanager" "wheel" ];
  };
  
  # Install firefox.
  programs = { 
#    hyprland = {
#      enable = true;
#      withUWSM  = true;
#      xwayland.enable = true;
#    };
#    waybar.enable = true;
    git = {
      enable = true;
      config = {
        user.name = "uloncl";
        user.email = "nebulous7554@gmail.com";
        init.defaultBranch = "main";
        init.safe.directory = "/etc/nixos";
      };
    };
    foot = {
      enable = true;
      settings = {
        main = {
          initial-window-size-pixels = "900x550";
          pad = "2x0 center";
        };
        colors = {
          foreground = "B9E31D";
          background = "3D2027";
          alpha = 0.8;
          regular0 = "3D2027";
          regular7 = "B9E31D";
        };
        csd = {
          color = "FA590B";
          size = 16;
          border-color = "FA590B";
          border-width = 2;
        };
      };
    };
    firefox.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    sessionVariables.NIXOS_OZONE_WL = "1";
    systemPackages = with pkgs; [ hyprland libsForQt5.layer-shell-qt waybar vesktop spotify fastfetch efibootmgr git foot gnome-tweaks seahorse libsecret krita chafa discordo spotify-player vscodium mullvad-vpn kdePackages.dolphin gnomeExtensions.just-perfection ffmpeg_6-headless finalmouse-udev-rules ];
    gnome.excludePackages = (with pkgs; [ gnome-tour xterm ]);
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
