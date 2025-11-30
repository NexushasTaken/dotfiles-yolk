#!/usr/bin/sh
source ./modules/main.sh

yolk unsync
if ask "Continue to Sync?" y; then
  yolk sync
fi
