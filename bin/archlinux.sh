#!/usr/bin/bash
source ./bin/utils.sh

pkgs=(
  "bat"
  "eza"
  "zoxide"
  "lazygit"
  "btop"
  "alacritty"
  "tmux"
  "ranger"
  "wget"
  "xdg-user-dirs"
  "caja"
  "gdb"
  "devhelp"

  "hyprland"
  "uwsm"
  "waybar"
  "rofi"
  "cliphist"
  "network-manager-applet"
  "udisks2"
  "udiskie"
  "dunst"
  "gnome-themes-extra"

  "ttf-hack-nerd"
  "noto-fonts"
  "noto-fonts-cjk"
  "noto-fonts-emoji"

  # Optionals
  "github-cli"
  #"superfile"
)

aur_pkgs=(
  "opentabletdriver"
)

if ! check-cmd paru; then
  # paru_link="https://github.com/NexushasTaken/paru-bin.git"
  paru_link="https://aur.archlinux.org/paru.git"
  paru_dir="$CACHE_DIR/$(basename "$paru_link")"
  [[ ! -d "$paru_dir" ]] && git clone "$paru_link" "$paru_dir"
  cd "$paru_dir"
  run makepkg -si --needed
fi

pkg-get "${pkgs[@]}"
USE_AUR=yes pkg-get "${aur_pkgs[@]}"

if ! compgen -G "$XDG_DATA_HOME/icons/phinger-cursors-*"; then
  if download https://github.com/phisch/phinger-cursors/releases/latest/download/phinger-cursors-variants.tar.bz2; then
    run mkdir -p "$XDG_DATA_HOME/icons"
    run tar xvfj "$CACHE_DIR/phinger-cursors-variants.tar.bz2" -C "$XDG_DATA_HOME/icons"
  fi
fi

pkg-exists opentabletdriver && service-enable --user opentabletdriver
pkg-exists waybar && service-enable --user waybar

run xdg-user-dirs-update
