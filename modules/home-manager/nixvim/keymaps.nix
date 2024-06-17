{
  programs.nixvim.keymaps = [
    {
      action = "<ESC>";
      key = "jk";
      options = { silent = true; };
      mode = "i";
    }
    {
      action = ":w <CR>";
      key = "<leader>w";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":q <CR>";
      key = "<leader>q";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":vs <CR>";
      key = "<leader>d";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":split <CR>";
      key = "<leader>s";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":bdelete <cr>";
      key = "<c-n>";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = "<C-w>h";
      key = "<leader>h";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = "<C-w>j";
      key = "<leader>j";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = "<C-w>k";
      key = "<leader>k";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = "<C-w>l";
      key = "<leader>l";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":";
      key = "<leader>;";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":bnext <CR>";
      key = "<S-l>";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":bprevious <CR>";
      key = "<S-h>";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = ":Neotree toggle <CR>";
      key = "z";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>";
      key = "<leader>f";
      options = { silent = true; };
      mode = "n";
    }
    {
      action = "<cmd>Telescope live_grep<CR>";
      key = "<leader>g";
      options = { silent = true; };
      mode = "n";
    }
  ];
}

