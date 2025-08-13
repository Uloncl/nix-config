{ pkgs, ... }: {
  home.packages = with pkgs; [ firefox ];

  home-manager.users.uloncl.programs.firefox = {
    enable = true;
    profiles = {
      uloncl = { Id = 0; name = "Uloncl"; search.default = "ddg"; };
      lewis = { Id = 1; name = "Lewis"; search.default = "ddg"; };
      burn = { Id = 2; name = "Burn"; search.default = "ddg"; };
    }
  };
}