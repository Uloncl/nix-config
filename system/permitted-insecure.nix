{ ... }: {
  nixpkgs.config.permittedInsecurePackages = [
    # just ventoy probably
  ];
}