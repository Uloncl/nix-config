{ ... }: {
	fileSystems."/" =	{ 
		device = "/dev/disk/by-uuid/27602e34-f840-4cb5-a98f-b5594eda453f";
		fsType = "ext4";
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/7CE5-1FAA";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
	};
}