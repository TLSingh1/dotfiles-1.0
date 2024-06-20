{
  imports = [
    # ./alpha.nix
    ./bufferline.nix
    ./cmp.nix
    ./comment.nix
    ./dashboard.nix
    ./hop.nix
    ./image.nix
    ./indent-blankline.nix
    ./lsp.nix
    ./lualine.nix
    ./neo-tree.nix
    /* ./neorg.nix */
    ./noice.nix
    /* ./none-ls.nix */
    ./notify.nix
    /* ./nvim-tree.nix */
    ./project.nix
    ./telescope.nix
    ./toggleterm.nix
  ];

  programs.nixvim.plugins = {
    friendly-snippets.enable = true;
    treesitter = { enable = true; ensureInstalled = "all"; };
    treesitter-context.enable = true;
    treesitter-textobjects.enable = true;
    # comment.enable = true;
    ts-context-commentstring.enable = true;
    ts-autotag.enable = true;

    # TODO: uncomment below if none-ls trash
    conform-nvim.enable = true;
    nvim-autopairs.enable = true;
    surround.enable = true;
    smart-splits.enable = true;
    luasnip = {
      enable = true;
      extraConfig = {
        enable_autosnippets = true;
      };
    };

    none-ls = {
      enable = true;
      enableLspFormat = true;
    };

    nvim-tree = {
      enable = false;
      autoClose = true;
      disableNetrw = true;
      hijackUnnamedBufferWhenOpening = true;
    };

  };
}
