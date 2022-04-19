#!/usr/bin/env bash

source "$HOME/.cache/wal/colors.sh"

rofi -show drun \
     -color-window "$background" \
     -color-normal "$background, $foreground, $background, $color1, $background" \
     -color-active "$background, $foreground, $background, $color1, $background"
