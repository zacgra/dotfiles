-- Must happen before plugins are loaded
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- Disable netrw (use neotree instead)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'
