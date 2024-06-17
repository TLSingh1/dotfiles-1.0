# { lib, config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      nv = "nvim";
      ls = "eza -l";
      tree = "eza -T";
      history = "history | nvim -";
    };
    interactiveShellInit = ''
      set fish_greeting
      starship init fish | source
      zoxide init --cmd cd fish | source
    '';
    shellInit = "";
  };
}
