source /etc/os-release

function pkg-get() {
  case "$ID" in
    arch)
      sudo pacman -S --needed "$@"
      ;;
    *)
      ;;
  esac
}

pkgs=(
  "bat"
  "eza"
  "zoxide"
  "lazygit"
)

pkg-get "${pkgs[@]}"
