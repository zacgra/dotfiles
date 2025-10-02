#!/usr/bin/env bash

# Dotfiles installation script
# Symlinks config directories to ~/.config and optionally sets up scripts

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR/config"
SCRIPTS_DIR="$SCRIPT_DIR/scripts"
TARGET_CONFIG="$HOME/.config"

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "Installing dotfiles from $SCRIPT_DIR"
echo

# Create ~/.config if it doesn't exist
if [[ ! -d "$TARGET_CONFIG" ]]; then
    echo -e "${YELLOW}Creating $TARGET_CONFIG${NC}"
    mkdir -p "$TARGET_CONFIG"
fi

# Symlink each config directory
for config_item in "$CONFIG_DIR"/*; do
    if [[ -d "$config_item" ]]; then
        config_name=$(basename "$config_item")
        target_path="$TARGET_CONFIG/$config_name"

        if [[ -L "$target_path" ]]; then
            echo -e "${YELLOW}Symlink already exists: $target_path${NC}"
        elif [[ -e "$target_path" ]]; then
            echo -e "${RED}Warning: $target_path already exists (not a symlink)${NC}"
            read -p "Backup and replace? (y/N): " -n 1 -r
            echo
            if [[ $REPLY =~ ^[Yy]$ ]]; then
                mv "$target_path" "$target_path.backup"
                ln -s "$config_item" "$target_path"
                echo -e "${GREEN}✓ Backed up and linked: $config_name${NC}"
            else
                echo -e "${YELLOW}Skipped: $config_name${NC}"
            fi
        else
            ln -s "$config_item" "$target_path"
            echo -e "${GREEN}✓ Linked: $config_name${NC}"
        fi
    fi
done

echo

# Install TPM (Tmux Plugin Manager) if tmux config exists
TPM_DIR="$TARGET_CONFIG/tmux/plugins/tpm"
if [[ -d "$TARGET_CONFIG/tmux" ]]; then
    if [[ -d "$TPM_DIR" ]]; then
        echo -e "${YELLOW}TPM already exists at $TPM_DIR${NC}"
        read -p "Reinstall TPM? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$TPM_DIR"
            git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
            echo -e "${GREEN}✓ TPM reinstalled${NC}"
            echo -e "${YELLOW}Note: Open tmux and press <prefix> + I (Ctrl-a + Shift-i) to install plugins${NC}"
        else
            echo -e "${YELLOW}Skipped TPM installation${NC}"
        fi
    else
        echo "Installing TPM (Tmux Plugin Manager)..."
        git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
        echo -e "${GREEN}✓ TPM installed${NC}"
        echo -e "${YELLOW}Note: Open tmux and press <prefix> + I (Ctrl-a + Shift-i) to install plugins${NC}"
    fi
fi

echo
echo -e "${GREEN}Dotfiles installation complete!${NC}"
echo

# Add scripts to PATH
SHELL_CONFIG=""
if [[ -f "$HOME/.zshrc" ]]; then
    SHELL_CONFIG="$HOME/.zshrc"
elif [[ -f "$HOME/.bashrc" ]]; then
    SHELL_CONFIG="$HOME/.bashrc"
fi

PATH_EXPORT="export PATH=\"\$PATH:$SCRIPTS_DIR\""

if [[ -n "$SHELL_CONFIG" ]]; then
    if grep -q "$SCRIPTS_DIR" "$SHELL_CONFIG"; then
        echo -e "${YELLOW}Scripts PATH already in $SHELL_CONFIG${NC}"
    else
        read -p "Add scripts to PATH in $SHELL_CONFIG? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "" >> "$SHELL_CONFIG"
            echo "# Dotfiles scripts" >> "$SHELL_CONFIG"
            echo "$PATH_EXPORT" >> "$SHELL_CONFIG"
            echo -e "${GREEN}✓ Added scripts to PATH in $SHELL_CONFIG${NC}"
            echo -e "${YELLOW}Note: Restart your shell or run: source $SHELL_CONFIG${NC}"
        else
            echo -e "${YELLOW}Skipped adding scripts to PATH${NC}"
            echo "You can manually add: $PATH_EXPORT"
        fi
    fi
else
    echo "Note: Scripts in $SCRIPTS_DIR can be added to your PATH"
    echo "Add this to your shell config: $PATH_EXPORT"
fi
