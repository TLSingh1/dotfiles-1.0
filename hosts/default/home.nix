{ pkgs, inputs, config, ... }:

{
  imports = [
    ../../modules/home-manager/kitty.nix
    ../../modules/home-manager/fish.nix
    ../../modules/home-manager/hyprland.nix
    ../../modules/home-manager/alacritty.nix
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home-manager/nixvim
    inputs.ags.homeManagerModules.default
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tai";
  home.homeDirectory = "/home/tai";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    htop
    btop
    discord
    dunst
    _1password-gui
    nitch
    eza
    telegram-desktop
    luajitPackages.lua-utils-nvim
    bun
    dart-sass
    fd
    brightnessctl
    swww
    matugen
    fzf
    hyprpicker
    slurp
    wf-recorder
    wayshot
    swappy
    asusctl
    librewolf
    zoxide
    grim
    imagemagick
    gnome.zenity
    wl-color-picker
    betterdiscordctl

    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/ags" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tai/.dotfiles/modules/home-manager/ags";
      recursive = true;
    };
    ".config/BetterDiscord/themes/translucence-plus.css" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tai/.dotfiles/modules/home-manager/apps/discord/blur-theme.css";
    };
    ".librewolf/afnctw1x.default/chrome/userChrome.css" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tai/.dotfiles/modules/home-manager/apps/librewolf/userChrome.css";
    };

    # "~/.config/ags".source = ../../modules/home-manager/ags;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tai/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };


  programs.git = {
    enable = true;  
    # NOTE: this is where i would like to use secrets
    userName = "TLSingh1";
    userEmail = "tai8910@gmail.com";
  };

  programs.neovim = {
    enable = false;
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.ags = {
    enable = true;
    extraPackages = with pkgs; [
      gtksourceview
      webkitgtk
      accountsservice
    ];
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
