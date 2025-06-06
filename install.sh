#!/usr/bin/env bash

DOTFILES='.'
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
DATA_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"

# PowerShell config
mkdir -p $CONFIG_DIR/powershell
cp $DOTFILES/profile.ps1 $CONFIG_DIR/powershell/Microsoft.PowerShell_profile.ps1

# PowerShell Ptyxis theme
mkdir -p $DATA_DIR/org.gnome.Ptyxis/palettes
cp $DOTFILES/powershell.palette $DATA_DIR/org.gnome.Ptyxis/palettes/powershell.palette
