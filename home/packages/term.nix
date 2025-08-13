{ pkgs, ... }: {
  home.packages = with pkgs; [ foot ghostty ];

  home-manager.users.uloncl.programs = {
    foot = {
      enable = true;
      server.enable = true;
      settings = { # https://codeberg.org/dnkl/foot/src/branch/master/foot.ini
        main = {
          # shell=$SHELL (if set, otherwise user's default shell from /etc/passwd)
          # term=foot (or xterm-256color if built with -Dterminfo=disabled)
          # login-shell=no
          # app-id=foot # globally set wayland app-id. Default values are "foot" and "footclient" for desktop and server mode
          # title=foot
          # locked-title=no
          # font=monospace:size=8
          # font-bold=<bold variant of regular font>
          # font-italic=<italic variant of regular font>
          # font-bold-italic=<bold+italic variant of regular font>
          # font-size-adjustment=0.5
          # line-height=<font metrics>
          # letter-spacing=0
          # horizontal-letter-offset=0
          # vertical-letter-offset=0
          # underline-offset=<font metrics>
          # underline-thickness=<font underline thickness>
          # strikeout-thickness=<font strikeout thickness>
          # box-drawings-uses-font-glyphs=no
          # dpi-aware=no
          # gamma-correct-blending=no
          # initial-color-theme=1
          initial-window-size-pixels="900x600";  # Or,
          # initial-window-size-chars=<COLSxROWS>
          # initial-window-mode=windowed
          pad="2x0 center"; # center-when-maximized-and-fullscreen
          # resize-by-cells=yes
          # resize-keep-grid=yes
          # resize-delay-ms=100
          # bold-text-in-bright=no
          # word-delimiters=,│`|:"'()[]{}<>
          # selection-target=primary
          # workers=<number of logical CPUs>
          # utmp-helper=/usr/lib/utempter/utempter  # When utmp backend is ‘libutempter’ (Linux)
          # utmp-helper=/usr/libexec/ulog-helper    # When utmp backend is ‘ulog’ (FreeBSD)
        };
        # environment.name=value
        # security.osc52=enabled  # disabled|copy-enabled|paste-enabled|enabled
        bell = {
          # system=yes
          # urgent=no
          # notify=no
          # visual=no
          # command=
          # command-focused=no
        };
        desktop-notifications = {
          # command=notify-send --wait --app-name ${app-id} --icon ${app-id} --category ${category} --urgency ${urgency} --expire-time ${expire-time} --hint STRING:image-path:${icon} --hint BOOLEAN:suppress-sound:${muted} --hint STRING:sound-name:${sound-name} --replace-id ${replace-id} ${action-argument} --print-id -- ${title} ${body}
          # command-action-argument=--action ${action-name}=${action-label}
          # close=""
          # inhibit-when-focused=yes
        };
        scrollback = {
          # lines=1000
          # multiplier=3.0
          # indicator-position=relative
          # indicator-format=""
        };
        url = {
          # launch=xdg-open ${url}
          # label-letters=sadfjklewcmpgh
          # osc8-underline=url-mode
          # regex=(((https?://|mailto:|ftp://|file:|ssh:|ssh://|git://|tel:|magnet:|ipfs://|ipns://|gemini://|gopher://|news:)|www\.)([0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]+|\([]\["0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\)|\[[\(\)"0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\]|"[]\[\(\)0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*"|'[]\[\(\)0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]*')+([0-9a-zA-Z/#@$&*+=~_%^\-]|\([]\["0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\)|\[[\(\)"0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*\]|"[]\[\(\)0-9a-zA-Z:/?#@!$&'*+,;=.~_%^\-]*"|'[]\[\(\)0-9a-zA-Z:/?#@!$&*+,;=.~_%^\-]*'))
          # You can define your own regex's, by adding a section called
          # 'regex:<ID>' with a 'regex' and 'launch' key. These can then be tied
          # to a key-binding. See foot.ini(5) for details
          # [regex:your-fancy-name]
          # regex=<a POSIX-Extended Regular Expression>
          # launch=<path to script or application> ${match}
          #
          # [key-bindings]
          # regex-launch=[your-fancy-name] Control+Shift+q
          # regex-copy=[your-fancy-name] Control+Alt+Shift+q
        };
        cursor = {
          # style=block
          # blink=no
          # blink-rate=500
          # beam-thickness=1.5
          # underline-thickness=<font underline thickness>
        };
        mouse = {
          # hide-when-typing=no
          # alternate-scroll-mode=yes
        };
        # touch.long-press-delay=400
        colors = {
          alpha=0.8;
          # alpha-mode=default # Can be `default`, `matching` or `all`
          background="3D2027";
          foreground="B9E31D";
          # flash=7f7f00
          # flash-alpha=0.5

          # cursor=<inverse foreground/background>

          ## Normal/regular colors (color palette 0-7)
          regular0="3D2027"; # 242424 black
          # regular1=f62b5a  # red
          # regular2=47b413  # green
          # regular3=e3c401  # yellow
          # regular4=24acd4  # blue
          # regular5=f2affd  # magenta
          # regular6=13c299  # cyan
          regular7="B9E31D";  # e6e6e6 white

          ## Bright colors (color palette 8-15)
          # bright0=616161   # bright black
          # bright1=ff4d51   # bright red
          # bright2=35d450   # bright green
          # bright3=e9e836   # bright yellow
          # bright4=5dc5f8   # bright blue
          # bright5=feabf2   # bright magenta
          # bright6=24dfc4   # bright cyan
          # bright7=ffffff   # bright white

          ## dimmed colors (see foot.ini(5) man page)
          # dim0=<not set>
          # ...
          # dim7=<not-set>

          ## The remaining 256-color palette
          # 16 = <256-color palette #16>
          # ...
          # 255 = <256-color palette #255>

          ## Sixel colors
          # sixel0 =  000000
          # sixel1 =  3333cc
          # sixel2 =  cc2121
          # sixel3 =  33cc33
          # sixel4 =  cc33cc
          # sixel5 =  33cccc
          # sixel6 =  cccc33
          # sixel7 =  878787
          # sixel8 =  424242
          # sixel9 =  545499
          # sixel10 = 994242
          # sixel11 = 549954
          # sixel12 = 995499
          # sixel13 = 549999
          # sixel14 = 999954
          # sixel15 = cccccc

          ## Misc colors
          # selection-foreground=<inverse foreground/background>
          # selection-background=<inverse foreground/background>
          # jump-labels=<regular0> <regular3>          # black-on-yellow
          # scrollback-indicator=<regular0> <bright4>  # black-on-bright-blue
          # search-box-no-match=<regular0> <regular1>  # black-on-red
          # search-box-match=<regular0> <regular3>     # black-on-yellow
          # urls=<regular3>
        };
        colors2 = {
          # Alternative color theme, see man page foot.ini(5)
        };
        csd = {
          # preferred=server
          size=16;
          # font=<primary font>
          color="FA590B";
          # hide-when-maximized=no
          # double-click-to-maximize=yes
          border-width=2;
          border-color="FA590B";
          # button-width=26
          # button-color=<background color>
          # button-minimize-color=<regular4>
          # button-maximize-color=<regular2>
          # button-close-color=<regular1>
        };
        key-bindings = {
          # scrollback-up-page=Shift+Page_Up Shift+KP_Page_Up
          # scrollback-up-half-page=none
          # scrollback-up-line=none
          # scrollback-down-page=Shift+Page_Down Shift+KP_Page_Down
          # scrollback-down-half-page=none
          # scrollback-down-line=none
          # scrollback-home=none
          # scrollback-end=none
          # clipboard-copy=Control+Shift+c XF86Copy
          # clipboard-paste=Control+Shift+v XF86Paste
          # primary-paste=Shift+Insert
          # search-start=Control+Shift+r
          # font-increase=Control+plus Control+equal Control+KP_Add
          # font-decrease=Control+minus Control+KP_Subtract
          # font-reset=Control+0 Control+KP_0
          # spawn-terminal=Control+Shift+n
          # minimize=none
          # maximize=none
          # fullscreen=none
          # pipe-visible=[sh -c "xurls | fuzzel | xargs -r firefox"] none
          # pipe-scrollback=[sh -c "xurls | fuzzel | xargs -r firefox"] none
          # pipe-selected=[xargs -r firefox] none
          # pipe-command-output=[wl-copy] none # Copy last command's output to the clipboard
          # show-urls-launch=Control+Shift+o
          # show-urls-copy=none
          # show-urls-persistent=none
          # prompt-prev=Control+Shift+z
          # prompt-next=Control+Shift+x
          # unicode-input=Control+Shift+u
          # color-theme-switch-1=none
          # color-theme-switch-2=none
          # color-theme-toggle=none
          # noop=none
          # quit=none
        };
        search-bindings = {
          # cancel=Control+g Control+c Escape
          # commit=Return KP_Enter
          # find-prev=Control+r
          # find-next=Control+s
          # cursor-left=Left Control+b
          # cursor-left-word=Control+Left Mod1+b
          # cursor-right=Right Control+f
          # cursor-right-word=Control+Right Mod1+f
          # cursor-home=Home Control+a
          # cursor-end=End Control+e
          # delete-prev=BackSpace
          # delete-prev-word=Mod1+BackSpace Control+BackSpace
          # delete-next=Delete
          # delete-next-word=Mod1+d Control+Delete
          # delete-to-start=Control+u
          # delete-to-end=Control+k
          # extend-char=Shift+Right
          # extend-to-word-boundary=Control+w Control+Shift+Right
          # extend-to-next-whitespace=Control+Shift+w
          # extend-line-down=Shift+Down
          # extend-backward-char=Shift+Left
          # extend-backward-to-word-boundary=Control+Shift+Left
          # extend-backward-to-next-whitespace=none
          # extend-line-up=Shift+Up
          # clipboard-paste=Control+v Control+Shift+v Control+y XF86Paste
          # primary-paste=Shift+Insert
          # unicode-input=none
          # scrollback-up-page=Shift+Page_Up Shift+KP_Page_Up
          # scrollback-up-half-page=none
          # scrollback-up-line=none
          # scrollback-down-page=Shift+Page_Down Shift+KP_Page_Down
          # scrollback-down-half-page=none
          # scrollback-down-line=none
          # scrollback-home=none
          # scrollback-end=none
        };
        url-bindings = {
          # cancel=Control+g Control+c Control+d Escape
          # toggle-url-visible=t
        };
        # text-bindings.\x03=Mod4+c  # Map Super+c -> Ctrl+c
        mouse-bindings = {
          # scrollback-up-mouse=BTN_WHEEL_BACK
          # scrollback-down-mouse=BTN_WHEEL_FORWARD
          # font-increase=Control+BTN_WHEEL_BACK
          # font-decrease=Control+BTN_WHEEL_FORWARD
          # selection-override-modifiers=Shift
          # primary-paste=BTN_MIDDLE
          # select-begin=BTN_LEFT
          # select-begin-block=Control+BTN_LEFT
          # select-extend=BTN_RIGHT
          # select-extend-character-wise=Control+BTN_RIGHT
          # select-word=BTN_LEFT-2
          # select-word-whitespace=Control+BTN_LEFT-2
          # select-quote = BTN_LEFT-3
          # select-row=BTN_LEFT-4

          # vim: ft=dosini
        };
      };
    };
    ghostty = {
      enable = true;
      settings = { # https://ghostty.org/docs/config/reference
        # font-family = "";
        # font-family-bold = "";
        # font-family-italic = "";
        # font-family-bold-italic = "";
        # font-style = "";
        # font-style-bold = "";
        # font-style-italic = "";
        # font-style-bold-italic = "";
        # font-synthetic-style = "";
        # font-feature = "";
        # font-size = "";
        # font-variation = "";
        # font-variation-bold = "";
        # font-variation-italic = "";
        # font-variation-bold-italic = "";
        # font-codepoint-map = "";
        # font-thicken = "";
        # font-thicken-strength = "";
        # alpha-blending = "";
        # adjust-cell-width = "";
        # adjust-cell-height = "";
        # adjust-font-baseline = "";
        # adjust-underline-position = "";
        # adjust-underline-thickness = "";
        # adjust-strikethrough-position = "";
        # adjust-strikethrough-thickness = "";
        # adjust-overline-position = "";
        # adjust-overline-thickness = "";
        # adjust-cursor-thickness = "";
        # adjust-cursor-height = "";
        # adjust-box-thickness = "";
        # grapheme-width-method = "";
        # freetype-load-flags = "";
        # theme = "";
        # background = "";
        # foreground = "";
        # selection-foreground = "";
        # selection-background = "";
        # selection-invert-fg-bg = "";
        # minimum-contrast = "";
        # palette = "";
        # cursor-color = "";
        # cursor-invert-fg-bg = "";
        # cursor-opacity = "";
        # cursor-style = "";
        # cursor-style-blink = "";
        # cursor-text = "";
        # cursor-click-to-move = "";
        # mouse-hide-while-typing = "";
        # mouse-shift-capture = "";
        # mouse-scroll-multiplier = "";
        # background-opacity = "";
        # background-blur = "";
        # unfocused-split-opacity = "";
        # unfocused-split-fill = "";
        # split-divider-color = "";
        # command = "";
        # initial-command = "";
        # wait-after-command = "";
        # abnormal-command-exit-runtime = "";
        # scrollback-limit = "";
        # link = "";
        # link-url = "";
        # maximize = "";
        # fullscreen = "";
        # title = "";
        # class = "";
        # x11-instance-name = "";
        # working-directory = "";
        # keybind = "";
        # window-padding-x = "";
        # window-padding-y = "";
        # window-padding-balance = "";
        # window-padding-color = "";
        # window-vsync = "";
        # window-inherit-working-directory = "";
        # window-inherit-font-size = "";
        # window-decoration = "";
        # window-title-font-family = "";
        # window-subtitle = "";
        # window-theme = "";
        # window-colorspace = "";
        # window-height = "";
        # window-width = "";
        # window-position-x = "";
        # window-position-y = "";
        # window-save-state = "";
        # window-step-resize = "";
        # window-new-tab-position = "";
        # window-titlebar-background = "";
        # window-titlebar-foreground = "";
        # resize-overlay = "";
        # resize-overlay-position = "";
        # resize-overlay-duration = "";
        # focus-follows-mouse = "";
        # clipboard-read = "";
        # clipboard-write = "";
        # clipboard-trim-trailing-spaces = "";
        # clipboard-paste-protection = "";
        # clipboard-paste-bracketed-safe = "";
        # title-report = "";
        # image-storage-limit = "";
        # copy-on-select = "";
        # click-repeat-interval = "";
        # config-file = "";
        # config-default-files = "";
        # confirm-close-surface = "";
        # quit-after-last-window-closed = "";
        # quit-after-last-window-closed-delay = "";
        # initial-window = "";
        # quick-terminal-position = "";
        # quick-terminal-screen = "";
        # quick-terminal-animation-duration = "";
        # quick-terminal-autohide = "";
        # quick-terminal-space-behavior = "";
        # shell-integration = "";
        # shell-integration-features = "";
        # osc-color-report-format = "";
        # vt-kam-allowed = "";
        # custom-shader = "";
        # custom-shader-animation = "";
        # app-notifications = "";
        # macos-non-native-fullscreen = "";
        # macos-titlebar-style = "";
        # macos-titlebar-proxy-icon = "";
        # macos-option-as-alt = "";
        # macos-window-shadow = "";
        # macos-auto-secure-input = "";
        # macos-secure-input-indication = "";
        # macos-icon = "";
        # macos-icon-frame = "";
        # macos-icon-ghost-color = "";
        # macos-icon-screen-color = "";
        # linux-cgroup = "";
        # linux-cgroup-memory-limit = "";
        # linux-cgroup-processes-limit = "";
        # linux-cgroup-hard-fail = "";
        # gtk-opengl-debug = "";
        # gtk-gsk-renderer = "";
        # gtk-single-instance = "";
        # gtk-titlebar = "";
        # gtk-tabs-location = "";
        # gtk-titlebar-hide-when-maximized = "";
        # adw-toolbar-style = "";
        # gtk-wide-tabs = "";
        # gtk-adwaita = "";
        # gtk-custom-css = "";
        # desktop-notifications = "";
        # bold-is-bright = "";
        # term = "";
        # enquiry-response = "";
        # auto-update = "";
        # auto-update-channel = "";
      };
    };
  };
}