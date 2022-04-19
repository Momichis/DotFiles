#!/bin/bash

DIR="$HOME/Pictures/Wallpapers/"
PIWAL="$HOME/.config/polybar/scripts/pywal.sh"

file=$(find ~/Pictures/Wallpapers -type f | shuf -n 1)
	$PIWAL $file

echo $file > /home/hyr00l/.scripts/current_wallpaper
