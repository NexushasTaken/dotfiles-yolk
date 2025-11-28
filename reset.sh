#!/usr/bin/sh
source ./modules/main.sh

yolk sync --canonical
if ask "Continue to sync?" y; then
  yolk sync
fi
