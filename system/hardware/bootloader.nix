{ boot, ... }: {
  boot = {
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
}