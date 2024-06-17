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
    extraConfigLua = ''
      local luasnip = require("luasnip")

      luasnip.filetype_extend("javascript", {"html"})
      luasnip.filetype_extend("javascriptreact", {"html"})
      luasnip.filetype_extend("typescriptreact", {"html"})

      -- ls.snippets.javascript = ls.snippets.html
      require("luasnip/loaders/from_vscode").load({include = {"html"}})
      require("luasnip/loaders/from_vscode").lazy_load()
    '';
  };
}
