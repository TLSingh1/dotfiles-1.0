{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./highlights.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    colorschemes.cyberdream = {
      enable = true;
      settings = {
        transparent = true;
        italic_comments = true;
        theme.highlights = {
          ActiveWindow.bg = "#16181A";
        };
      };
    };
  };
}
