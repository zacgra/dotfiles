return {
  {
    'projekt0n/github-nvim-theme',
    lazy = false, -- Load during startup
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('github-theme').setup {
        -- Optional configuration here
      }

      -- Load the colorscheme
      -- Available variants: github_dark, github_dark_dimmed, github_dark_high_contrast,
      -- github_dark_colorblind, github_light, github_light_default, github_light_high_contrast, github_light_colorblind
      vim.cmd.colorscheme 'github_dark_default'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
