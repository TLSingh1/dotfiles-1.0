{
  programs.nixvim.plugins.indent-blankline = {
    enable = true;
    settings = {
      scope = {
        enabled = true;
        show_start = true;
        show_end = true;
        show_exact_scope = true;
      };
    };
  };
}
