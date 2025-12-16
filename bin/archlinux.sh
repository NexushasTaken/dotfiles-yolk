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

  # Utilities
  "wget"
)

pkg-get "${pkgs[@]}"

if ! compgen -G "$XDG_DATA_HOME/icons/phinger-cursors-*"; then
  if download https://github.com/phisch/phinger-cursors/releases/latest/download/phinger-cursors-variants.tar.bz2; then
    run mkdir -p "$XDG_DATA_HOME/icons"
    run tar xvfj "$CACHE_DIR/phinger-cursors-variants.tar.bz2" -C "$XDG_DATA_HOME/icons"
  fi
fi

if ! check-cmd paru; then
  [[ ! -d "$CACHE_DIR/paru" ]] && git clone git@github.com:NexushasTaken/paru-bin.git "$CACHE_DIR/paru"
  cd "$CACHE_DIR/paru"
  makepkg -si --needed
fi

