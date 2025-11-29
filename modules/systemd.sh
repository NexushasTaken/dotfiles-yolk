function enable-service() {
  local service="$1"
  if systemctl is-enabled --quiet "$service"; then
    log "$service is already enabled."
  else
    sudo systemctl enable "$service"
    log "$service is now enabled."
  fi
}

