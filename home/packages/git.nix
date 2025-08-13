{ pkgs, ... }: {
  home.packages = with pkgs; [ git ];

  home-manager.users.uloncl.programs.git = {
    enable = true;
    lfs.enable = true;
    diff.enable = true;
    userName = "uloncl";
    userEmail = "nebulous7554@gmail.com";
  };
}