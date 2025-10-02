# Neovim Configuration File Structure

## Core Files

| File | Purpose |
|------|---------|
| `init.lua` | Entry point - sets leader key (`<space>`), loads all modules |
| `lua/options.lua` | Vim settings (line numbers, clipboard, splits, scrolloff, etc.) |
| `lua/keymaps.lua` | Basic keybindings (window nav `<C-hjkl>`, clear search `<Esc>`, terminal mode, highlight on yank) |
| `lua/lazy-bootstrap.lua` | Auto-installs lazy.nvim plugin manager if not present |
| `lua/lazy-plugins.lua` | Loads all plugin specs, configures lazy.nvim UI |

## Active Plugins (kickstart/plugins/)

| File | Purpose |
|------|---------|
| `telescope.lua` | Fuzzy finder - files, grep, help, buffers. Maps: `<leader>sf/sg/sh/sk/ss/sw/sd/sr/s./sn`, `<leader>/`, `<leader><leader>` |
| `lspconfig.lua` | LSP config + Mason installer. Servers: `lua_ls`. Maps: `grn/gra/grr/gri/grd/grD/grt`, `gO/gW`, `<leader>th` |
| `conform.lua` | Auto-formatting (lazy-loaded). Formatters: `stylua` for Lua. Map: `<leader>f`. Format on save enabled (except C/C++) |
| `blink-cmp.lua` | Autocompletion engine |
| `treesitter.lua` | Syntax highlighting & code parsing |
| `gitsigns.lua` | Git integration (show changes in sign column) |
| `which-key.lua` | Shows available keybindings in popup |
| `tokyonight.lua` | Colorscheme |
| `todo-comments.lua` | Highlight TODO/FIXME/NOTE comments |
| `mini.lua` | Mini.nvim modules (statusline, surround, etc.) |

## Optional Plugins (commented out in lazy-plugins.lua)

| File | Purpose |
|------|---------|
| `debug.lua` | DAP (Debug Adapter Protocol) support |
| `indent_line.lua` | Show indent guides |
| `lint.lua` | Linting support |
| `autopairs.lua` | Auto-close brackets/quotes |
| `neo-tree.lua` | File explorer sidebar |

## Custom Plugins

| File | Purpose |
|------|---------|
| `lua/custom/plugins/init.lua` | Empty - add your own plugins here |

## Documentation

| File | Purpose |
|------|---------|
| `README.md` | Kickstart.nvim documentation |
| `LICENSE.md` | License file |
| `doc/kickstart.txt` | Vim help documentation |
| `doc/tags` | Generated help tags |

## Key Takeaways

- **Lazy loading**: conform, blink-cmp, telescope only load when needed
- **Leader key**: `<space>`
- **LSP installed**: Only `lua_ls` by default (add more in `lspconfig.lua:210-237`)
- **Formatters**: Only `stylua` installed
