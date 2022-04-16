#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/colors.ini"
RFILE="$HOME/.config/polybar/colorblocks/scripts/rofi/colors.rasi"
BFILE="$HOME/.config/bspwm/bspwmrc"
DFILE="$HOME/.config/dunst/dunstrc"

# Get colors
pywal_get() {
	/home/hyr00l/.local/bin/wal -i "$1" -q -t -a 75
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/foreground-alt = #.*/foreground-alt = $FGA/g" $PFILE
	sed -i -e "s/shade1 = #.*/shade1 = $SH1/g" $PFILE
	sed -i -e "s/shade2 = #.*/shade2 = $SH2/g" $PFILE
	sed -i -e "s/shade3 = #.*/shade3 = $SH3/g" $PFILE
	sed -i -e "s/shade4 = #.*/shade4 = $SH4/g" $PFILE
	sed -i -e "s/shade5 = #.*/shade5 = $SH5/g" $PFILE
	sed -i -e "s/shade6 = #.*/shade6 = $SH6/g" $PFILE
	sed -i -e "s/shade7 = #.*/shade7 = $SH7/g" $PFILE
	sed -i -e "s/shade8 = #.*/shade8 = $SH8/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  bg1:   ${SH8}FF;
	  bg2:   ${SH7}FF;
	  bg3:   ${SH6}FF;
	  fg:    ${FGA}FF;
	}
	EOF

	#bspwm
        sed -i -e "s/bspc config focused_border_color '#.*/bspc config focused_border_color '$FGA'/g" $BFILE
        sed -i -e "s/bspc config normal_border_color '#.*/bspc config normal_border_color '$BG'/g" $BFILE
        sed -i -e "s/bspc config active_border_color '#.*/bspc config active_border_color '$BG'/g" $BFILE

	#dunst
	sed -i -e "s/background = \"#.*/background = \"$BG\"/g" $DFILE
        sed -i -e "s/foreground = \"#.*/foreground = \"$FGA\"/g" $DFILE
	sed -i -e "s/frame_color = \"#.*/frame_color = \"$FGA\"/g" $DFILE




	polybar-msg cmd restart
	bspc config active_border_color $BG
	bspc config normal_border_color $BG
	bspc config focused_border_color $FGA
	killall dunst;dunst &
}

# Main
if [[ -f "/home/hyr00l/.local/bin/wal" ]]; then
	if [[ "$1" ]]; then
		pywal_get "$1"

		# Source the pywal color file
		. "$HOME/.cache/wal/colors.sh"

		BG=`printf "%s\n" "$background"`
		FG=`printf "%s\n" "$color0"`
		FGA=`printf "%s\n" "$color7"`
		SH1=`printf "%s\n" "$color1"`
		SH2=`printf "%s\n" "$color2"`
		SH3=`printf "%s\n" "$color1"`
		SH4=`printf "%s\n" "$color2"`
		SH5=`printf "%s\n" "$color1"`
		SH6=`printf "%s\n" "$color2"`
		SH7=`printf "%s\n" "$color1"`
		SH8=`printf "%s\n" "$color2"`

		change_color
	else
		echo -e "[!] Please enter the path to wallpaper. \n"
		echo "Usage : ./pywal.sh path/to/image"
	fi
else
	echo "[!] 'pywal' is not installed."
fi