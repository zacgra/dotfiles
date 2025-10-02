# dotfiles

Personal development environment configuration files.

## Installation

1. Clone this repository:
```bash
git clone <repo-url> ~/github/dotfiles
cd ~/github/dotfiles
```

2. Run the install script:
```bash
./install.sh
```

This will symlink configuration directories from `config/` to `~/.config/`.

3. Add scripts to your PATH (optional):
```bash
# Add to ~/.bashrc or ~/.zshrc
export PATH="$PATH:$HOME/github/dotfiles/scripts"
```

## Structure

- `config/` - Configuration files that symlink to `~/.config/*`
  - `tmux/` - tmux configuration with Catppuccin theme
- `scripts/` - Utility scripts
  - `tmx` - tmux session manager using fzf
- `install.sh` - Symlink installation script

## What's Included

### tmux
- Prefix: `Ctrl-a`
- Vim-style navigation and window management
- Catppuccin Mocha theme
- Session persistence with tmux-resurrect

### Scripts
- **tmx**: Quickly switch between tmux sessions for git projects in `~/code` and `~/.config`
