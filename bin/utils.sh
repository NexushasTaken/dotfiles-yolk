set -euo pipefail

source /etc/os-release

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
  case "$ID" in
    arch)
      run sudo pacman -S --needed "$@"
      ;;
    *)
      ;;
  esac
}
