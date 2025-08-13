{ pkgs, ... }: {
  home.packages = with pkgs; [ vesktop ];

  home-manager.users.uloncl.programs.vesktop = {
    enable = true;
    settings = { # https://github.com/Vencord/Vesktop/blob/main/src/shared/settings.d.ts
      discordBranch = "stable"; # "stable" | "canary" | "ptb";
      transparencyOption = "mica"; # "none" | "mica" | "tabbed" | "acrylic";
    };
    vencord.themes = "https://raw.githubusercontent.com/Lylythii/BetterDiscordAddons/main/Themes/Glass/Glass.theme.css";
    vencord.settings = { # https://github.com/Vendicated/Vencord/blob/main/src/api/Settings.ts
      enableReactDevtools = true;
      frameless = true;
      transparent = true;
    };
  };
}