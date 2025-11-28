#!/usr/bin/sh
source ./modules/main.sh
source ./modules/archlinux.sh
source ./modules/systemd.sh

install ly
enable-service ly.service
