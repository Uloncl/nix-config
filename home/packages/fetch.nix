{ pkgs, ... }: {
  home.packages = with pkgs; [ fastfetch onefetch starfetch ];
  
  home-manager.users.uloncl.programs = {
    fastfetch = {
      enable = true;
      settings = {
        "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
        logo = {
          type = "sixel";
          source = "/home/uloncl/.config/fastfetch/uloncl_pfp.png";
          width = 50;
          # "height": 46;
          printRemaining = false;
          preserveAspectRatio = true;
          recache = true;
          padding = {
            top = 8;
            left = 2;
            right = 2;
          };
          chafa = {
            canvasMode = "TRUECOLOR";
            ditherMode = "DIFFUSION";
          };
        };
        display = {
          # "showErrors": true;
          disableLinewrap = true;
          separator = " ";
          key = {
            width = 24;
          };
          color = {
            keys = "#fa590b";
            output = "#fa590b";
          };
        };
        modules = [
          { type= "custom"; }
          {
            type = "title";
            key = " ";
            format = "{#1;#00bf50}{user-name}{#white}@{##fa590b}{host-name}";
          } {
            type = "uptime";
            key = " ";
            format = "{#1;#00bf50}Uptime:{#0;#fa590b}{hours}:{minutes}:{seconds}:{milliseconds}";
          }
          
          { type= "custom"; keyColor= "#fa590b"; key= "╭────────────────────────────── ─ ─  ─   -"; }
          {
            type = "os";
            key = "│ {##00bf50}OS";
            format = "{name} {version} {arch} {build-id}";
          } {
            type = "kernel";
            key = "│ {##00bf50}Kernel";
            format = "{sysname} {release} {arch}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "├────────────────────────────── ─ ─  ─   -"; }
          {
            type = "shell";
            key = "│ {##00bf50}Shell";
            format = "{process-name} {version}";
          } {
            type = "editor";
            key = "│ {##00bf50}Editor";
            format = "{name} {version}";
          } {
            type = "terminal";
            key = "│ {##00bf50}Terminal";
            format = "{process-name} {version}";
          } {
            type = "terminalfont";
            key = "│ {##00bf50}Terminal Font";
            format = "{name} {size}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "├────────────────────────────── ─ ─  ─   -"; }
          {
            type = "de";
            key = "│ {##00bf50}Desktop Environment";
            format = "{process-name} {version}";
          } {
            type = "wm";
            key = "│ {##00bf50}Window Manager";
            format = "{protocol-name} {plugin-name} {version}";
          } {
            type = "lm";
            key = "│ {##00bf50}lm";
            format = "{service} {type} {version}";
          } {
            type = "wmtheme";
            key = "│ {##00bf50}WM Theme";
            format = "{result}";
          } {
            type = "theme";
            key = "│ {##00bf50}theme";
            format = "{theme2}";
          } {
            type = "icons";
            key = "│ {##00bf50}icons";
            format = "{icons2}";
          } {
            type = "font";
            key = "│ {##00bf50}Font";
            format = "{combined}";
          } {
            type = "cursor";
            key = "│ {##00bf50}Cursor";
            format = "{theme} {size}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "├────────────────────────────── ─ ─  ─   -"; }
          {
            type = "host";
            key = "│ {##00bf50}Host";
            format = "{vendor} {name} {version}";
          } {
            type = "display";
            key = "│ {##00bf50}Display";
            compactType = "original-with-refresh-rate";
            format = "{name} {inch}\" {width}x{height} {refresh-rate}fps";
          } {
            type = "cursor";
            key = "│ {##00bf50}Cursor";
            format = "{theme} {size}";
          } {
            type = "cpu";
            key = "│ {##00bf50}CPU";
            format = "{name} {cores-logical} {freq-max} {temperature}";
          } {
            type = "gpu";
            key = "│ {##00bf50}GPU";
            format = "{name} {frequency}";
          } {
            type = "memory";
            key = "│ {##00bf50}Memory";
            format = "{used}/{total} {percentage}";
          } {
            type = "disk";
            key = "│ {##00bf50}Disk";
            format = "{name} {filesystem} {size-used}/{size-total} {size-percentage}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "├────────────────────────────── ─ ─  ─   -"; }
          {
            type = "disk";
            key = "│ {##00bf50}Disk ";
            folders = "/dev/nvme0n1p2:/dev/sdb1";
            format = "{name} {filesystem} {size-used}/{size-total} {size-percentage}";
          } {
            type = "physicaldisk";
            key = "│ {##00bf50}Physical Disk ";
            format = "{physical-type} {##00bf50}{name} {##fa590b}{size} {temperature}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "├────────────────────────────── ─ ─  ─   -"; }
          {
            type = "mouse";
            key = "│ {##00bf50}Mouse ";
            format = "{name}";
          } {
            type = "keyboard";
            key = "│ {##00bf50}Keyboard ";
            format = "{name}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "├────────────────────────────── ─ ─  ─   -"; }
          {
            type = "media";
            key = "│ {##00bf50}Media";
            format = "{title} by {artist} - {status}";
          }
          { type= "custom"; keyColor= "#fa590b"; key= "╰────────────────────────────── ─ ─  ─   -"; }
          # "colors"
        ]
      };
    };
  };
}