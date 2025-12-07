#!/usr/bin/bash
source ./bin/utils.sh

pkgs=(
  "bat"
  "eza"
  "zoxide"
  "lazygit"
  "btop"
  "alacritty"

  # Optionals
  #"github-cli"
  #"superfile"
)

pkg-get "${pkgs[@]}"
