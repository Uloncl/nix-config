{ ... }: {
	fileSystems."/" =	{ 
		device = "/dev/disk/by-uuid/6b102317-1fbb-4a72-8706-aaefab5b5ed5";
		fsType = "ext4";
	};

	fileSystems."/boot" = { 
		device = "/dev/disk/by-uuid/F2F9-E82E";
		fsType = "vfat";
		options = [ "fmask=0077" "dmask=0077" ];
	};

	fileSystems."/data" = { 
		device = "/dev/disk/by-uuid/7650536E50533459";
		fsType = "ntfs";
	};
}