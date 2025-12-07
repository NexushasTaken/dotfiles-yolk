#!/usr/bin/bash
source ./bin/utils.sh

pkgs=(
  "bat"
  "eza"
  "zoxide"
  "lazygit"

  # Optionals
  #"github-cli"
  #"superfile"
)

pkg-get "${pkgs[@]}"
