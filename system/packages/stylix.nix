{ lib, pkgs, inputs, userSettings, ... }: let 
  themeDir = "../../themes/${userSettings.theme}";
  themePath = "${themeDir}/${userSettings.theme}.yaml";
  themePolarity = lib.removeSuffix "\n" (builtins.readFile "${themeDir}/polarity.txt" ) ;
  backgroundPath = builtins.readFile ( ./. + "../../themes/${themeDir}/background.txt" );
in {
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    autoEnable = true;
    polarity = themePolarity;
    image = backgroundPath;
    base16Scheme = themePath;
    fonts = {
      monospace = {
        name = userSettings.font;
        package = userSettings.fontPackage;
      };
      serif = {
        name = userSettings.font;
        package = userSettings.fontPackage;
      };
      sansSerif = {
        name = userSettings.font;
        package = userSettings.fontPackage;
      };
      emoji = {
        name = "Nono Colour Emoji";
        package = pkgs.noto-fonts-emoji-blob-bin;
      };
    };
  };
}