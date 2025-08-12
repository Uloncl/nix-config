{ ... }: {
  nix = {
    gc.automatic = true;
    gc.dates = "weekly";
    gc.options = "--delete-older-than 30d";
    settings.auto-optimise-store = true;
  };
}