#!/usr/bin/bash
source ./bin/utils.sh

pkgs=(
  "bat"
  "eza"
  "zoxide"
  "lazygit"
  "btop"
  "alacritty"

  "hyprland"
  "uwsm"

  "ttf-hack-nerd"
  "noto-fonts"
  "noto-fonts-cjk"
  "noto-fonts-emoji"

  # Optionals
  #"github-cli"
  #"superfile"
)

pkg-get "${pkgs[@]}"
