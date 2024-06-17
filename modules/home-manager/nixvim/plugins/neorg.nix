{
  programs.nixvim.plugins.neorg = {
    enable = true; # TODO re-enable when neorg is fixed
      modules = {
        "core.defaults".__empty = null;

        "core.keybinds".config.hook.__raw = ''
          function(keybinds)
            keybinds.unmap('norg', 'n', '<C-s>')
          end
          '';

        "core.dirman".config.workspaces = {
          brain = "~/Brain";
        };

        "core.concealer".__empty = null;
        "core.completion".config.engine = "nvim-cmp";
        "core.qol.toc".config.close_after_use = true;
      };
  };
}
