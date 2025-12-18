set -euo pipefail

source /etc/os-release

# XDG Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DATA_DIRS="/usr/local/share:/usr/share"
export XDG_CONFIG_DIRS="/etc/xdg"

CACHE_DIR="${XDG_CACHE_HOME}/yolk"

function to_ansi() {
  printf '\001\e[%sm\002' $1
}

function ansi() {
  case "$1" in
    (reset)   to_ansi 0;;
    (black)   to_ansi 30;;
    (red)     to_ansi 31;;
    (green)   to_ansi 32;;
    (yellow)  to_ansi 33;;
    (blue)    to_ansi 34;;
    (magenta) to_ansi 35;;
    (cyan)    to_ansi 36;;
    (white)   to_ansi 37;;
    (orange)  to_ansi 38\;5\;166;;
  esac
}

function error() {
  echo "$(ansi green)HOOKS$(ansi reset) $(ansi red)Error$(ansi reset): $@"
  exit 1
}

function on-error() {
  if [[ "$?" -ne "0" ]]; then
    error "$@"
  fi
}

function info() {
  echo "$(ansi green) HOOKS Info$(ansi reset): $@"
}

function answer-normalize() {
  local arg="$1"
  local input="${arg,,}"     # lowercase

  case "$input" in
    y|n|yes|no) ;;                  # ok
    *)
      echo $arg
      return 1;;
  esac
  input="${input:0:1}"       # first character

  printf "%s" "$input"
}

function answer-colorized() {
  # colored version
  local answer="$1"
  case "$answer" in
    y) answer="$(ansi green)y$(ansi reset)" ;;
    n) answer="$(ansi red)n$(ansi reset)" ;;
  esac
  echo "$answer"
}

# ---- Prompt for yes/no ----
function ask() {
  local prompt="$1"
  local answer=""

  # normalize default (y/n)
  local default_answer="$(answer-normalize "${2:-n}")"
  on-error

  echo "HOOKS $(ansi green)Ask$(ansi reset): $prompt"
  echo "Please enter '$(ansi green)y$(ansi reset)' for yes or '$(ansi red)n$(ansi reset)' for no (default: '$(answer-colorized "$default_answer")')."

  read -r -p "$(ansi blue)>$(ansi reset) " answer

  # empty input = use default
  if [[ -z "$answer" ]]; then
    answer="$default_answer"
  else
    answer="$(answer-normalize "$answer")"
    on-error "Invalid answer: $answer"
  fi

  info "Answered: $(answer-colorized "$answer")"

  [[ "$answer" == "y" ]]
}

function check-cmd() {
  command -v "$1" >/dev/null 2>&1
}

function run() {
  if [[ "$1" == "-q" ]]; then
    shift
  else
    echo "$(ansi green) HOOKS Running$(ansi reset): $@"
  fi
  "$@"
}


function dir-make() {
  run mkdir -p "$@"
}

function dir-remove() {
  run rmdir "$@"
}

function pkg-get() {
  local sudo="sudo"
  case "$ID" in
    arch)
      local PKG_MGR="${PKG_MGR:-}"
      local USE_AUR="${USE_AUR:-}"

      if [[ -n "$USE_AUR" && -z "$PKG_MGR" ]]; then
        check-cmd yay && PKG_MGR=yay
        check-cmd paru && PKG_MGR=paru
      fi

      if [[ -n "$USE_AUR" ]]; then
        run "$PKG_MGR" -S --needed "$@"
      else
        run sudo pacman -S --needed "$@"
      fi
      ;;
    *)
      ;;
  esac
}

function pkg-file() {
  case "$ID" in
    arch)
      run sudo pacman -U --needed "$@"
      ;;
    *)
      ;;
  esac
}

function pkg-exists() {
  case "$ID" in
    arch)
      run pacman -Qi "$@" &> /dev/null
      ;;
    *)
      ;;
  esac
}

function download() {
  local cache=false
  local link=""
  local out=""

  link="${1:-}"
  out="${2:-}"

  # Require a link
  if [[ -z "$link" ]]; then
    error "usage: download <direct-link> [<output>]"
  fi

  if [[ -z "$out" ]]; then
    out="$CACHE_DIR/$(basename "$link")"
    run mkdir -p "$(dirname "$out")"
  fi

  # Download
  info "Downloading $(basename "$link")"
  run wget --passive-ftp -c -O "$out" "$link"
}

function service-enable() {
  if ! run systemctl is-enabled "$@"; then
    run systemctl enable "$@"
  fi
}
