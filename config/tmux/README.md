# tmux Configuration

Custom tmux configuration with vim-style navigation and Catppuccin Mocha theme.

## Features

- **Prefix**: `Ctrl-a` (instead of default `Ctrl-b`)
- **Mouse support**: Enabled
- **Vi mode**: Copy mode uses vi keybindings
- **Window/Pane indexing**: Starts at 1 (not 0)

## Key Bindings

### Prefix
- `Ctrl-a` - Prefix key
- `Ctrl-a Ctrl-a` - Send prefix to nested tmux/applications

### Pane Navigation (Vim-style)
- `Ctrl-a h/j/k/l` - Move between panes (left/down/up/right)
- Seamless navigation with vim via `vim-tmux-navigator` plugin

### Pane Resizing (Vim-style)
- `Ctrl-a H/J/K/L` - Resize pane (left/down/up/right)
- Repeatable without re-pressing prefix

### Pane Splitting
- `Ctrl-a |` - Split horizontally (opens in current path)
- `Ctrl-a -` - Split vertically (opens in current path)

### Session Management
- `Ctrl-a Ctrl-j` - Quick session switcher

### Configuration
- `Ctrl-a r` - Reload tmux configuration

## Theme

Using **Catppuccin Mocha** with customized status bar showing:
- Current directory
- Session name

## Plugins (via TPM)

- **tpm** - Tmux Plugin Manager
- **tmux-sensible** - Sensible default settings
- **vim-tmux-navigator** - Seamless vim/tmux pane navigation
- **catppuccin/tmux** - Catppuccin theme
- **tmux-resurrect** - Save/restore tmux sessions
- **tmux-continuum** - Automatic session saving (every 15 minutes) and restoration

### Installing Plugins

After installation, open tmux and press:
- `Ctrl-a I` (Shift-i) - Install plugins
- `Ctrl-a U` (Shift-u) - Update plugins
- `Ctrl-a Alt-u` - Uninstall plugins not in config

## Session Persistence

Sessions are automatically saved every 15 minutes and restored on tmux start via `tmux-continuum`.

For neovim, session strategy is enabled via `tmux-resurrect`.
