# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Claude-Specific Tools
- fd-find
- ripgrep
- jq
- tree (always use with -J flag for JSON output)


## Repository Overview

Personal dotfiles repository using a symlink-based structure for managing development environment configuration.

### Structure

```
repo/
  config/          # Configuration files that symlink to ~/.config/*
    tmux/          # tmux configuration with TPM plugins
    nvim/          # Neovim config (kickstart-modular.nvim fork)
  scripts/         # Utility scripts
  docs/            # Documentation
  install.sh       # Symlink installation and TPM setup script
```

Configuration directories in `config/` are symlinked to `~/.config/` by the install script.

## Installation

Run `./install.sh` to:
1. Symlink `config/*` directories to `~/.config/*`
2. Install TPM (Tmux Plugin Manager) if tmux config exists
3. Backup existing configs before replacing (prompts user)

After installation:
- Install tmux plugins: Open tmux and press `Ctrl-a + Shift-i`
- Add scripts to PATH: `export PATH="$PATH:$HOME/github/dotfiles/scripts"` in shell config

## Scripts

### `tmx` - tmux sessionizer
Fuzzy-find and switch to tmux sessions for git projects:
- Searches for `.git` directories in `~/code` and `~/.config`
- Uses `fzf` for interactive selection
- Creates new tmux session or switches to existing one
- Session names derived from directory basename (`.` → `_`)

Usage: `./scripts/tmx [optional-path]`

### `tmux-reload` - reload tmux config
Reloads tmux config if server is running, otherwise starts tmux.

Usage: `./scripts/tmux-reload`

## Neovim Configuration (`config/nvim/`)

Fork of [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim) - a modular Neovim configuration.

**Features:**
- Lazy.nvim plugin manager
- LSP support with mason.nvim
- Telescope for fuzzy finding
- Treesitter for syntax highlighting
- Vim-tmux-navigator integration

**Dependencies:**
- fd-find (file search)
- ripgrep (text search)
- Nerd Font (optional, for icons)

See `config/nvim/README.md` for full documentation.

## tmux Configuration (`config/tmux/tmux.conf`)

**Key bindings:**
- Prefix: `Ctrl-a` (not default `Ctrl-b`)
- Split panes: `|` horizontal, `-` vertical
- Vim navigation: `h/j/k/l` to move, `H/J/K/L` to resize
- Reload config: `<prefix> + r`
- Session chooser: `Ctrl-a + Ctrl-j`

**Features:**
- Mouse support enabled
- Vi mode for copy/paste (`v` to select, `y` to yank)
- Windows/panes start at index 1
- Catppuccin Mocha theme
- 256-color and RGB support

**Plugins (TPM):**
- `vim-tmux-navigator` - Seamless vim/tmux pane navigation
- `tmux-resurrect` + `tmux-continuum` - Session persistence (auto-saves every 15 min)
- `catppuccin/tmux` - Theme
