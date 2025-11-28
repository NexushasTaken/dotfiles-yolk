set -euo pipefail

source /etc/os-release

# ---- ANSI helper functions ----
function to_ansi() { printf '\001\e[%sm\002' "$1"; }

function ansi() {
  case "$1" in
    reset)   to_ansi 0 ;;
    black)   to_ansi 30 ;;
    red)     to_ansi 31 ;;
    green)   to_ansi 32 ;;
    yellow)  to_ansi 33 ;;
    blue)    to_ansi 34 ;;
    magenta) to_ansi 35 ;;
    cyan)    to_ansi 36 ;;
    white)   to_ansi 37 ;;
    orange)  to_ansi 38\;5\;166 ;;
  esac
}

function error() {
  printf '[%serror%s]: ' "$(ansi red)" "$(ansi reset)"
  printf '%s ' "$@"
  printf '\n'
  exit 1
}

function log() {
  printf '[%slog%s]: ' "$(ansi blue)" "$(ansi reset)"
  printf '%s ' "$@"
  printf '\n'
  return 0
}

# ---- Prompt for yes/no ----
function ask() {
  local choice_yes="$(ansi green)y$(ansi reset)"
  local choice_no="$(ansi red)n$(ansi reset)"
  local prompt="$1" answer
  local default_choice="${2:-n}"
  echo "default_choice: $default_choice"
  echo "$prompt"
  echo "Please enter '$choice_yes' for yes or '$choice_no' for no (default: '$default_choice')."
  read -r -p "$(ansi blue)>$(ansi reset) " answer

  if [[ -z "$answer" ]]; then
    answer="$default_choice"
  fi

  [[ "$answer" =~ ^[Yy]$ ]]
}

