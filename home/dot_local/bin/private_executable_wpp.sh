#!/bin/sh

ppr="$(find $HOME/pix/wall/ | sort | fzf --preview='chafa {}' --preview-window=default:right:75%)"
choice=$(echo "Fill\nMax\nTest-Fill\nTest-Max" | fzf)

find_colors() {
	black="$( grep 'color0:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	red="$( grep 'color1:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	green="$( grep 'color2:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	yellow="$( grep 'color3:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	blue="$( grep 'color4:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	magenta="$( grep 'color5:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	cyan="$( grep 'color6:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	white="$( grep 'color7:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
	select="$( grep 'color8:' $HOME/.cache/wal/colors.yml | sed 's/ *color[0-9]: //' )"
}

build_alac() {
	echo "colors: \n  primary: "
	echo "    background: $black"
	echo "    foreground: $white"
	echo "  cursor: \n    text: CellBackground"
	echo "    cursor: $white"
	echo "  selection: \n    text: CellBackground"
	echo "    background: $select"
	echo "  normal:"
	echo "    black: $black"
	echo "    red: $red"
	echo "    green: $green"
	echo "    yellow: $yellow"
	echo "    blue: $blue"
	echo "    magenta: $magenta"
	echo "    cyan: $cyan"
	echo "    white: $white"
	echo "  bright:"
	echo "    black: $select"
	echo "    red: $red"
	echo "    green: $green"
	echo "    yellow: $yellow"
	echo "    blue: $blue"
	echo "    magenta: $magenta"
	echo "    cyan: $cyan"
	echo "    white: $white"
}

build_zellij() {
	echo "themes {"
	echo "    default {"
	echo "        bg $black"
	echo "        fg $white"
	echo "        black $black"
	echo "        red $red"
	echo "        green $green"
	echo "        yellow $yellow"
	echo "        blue $blue"
	echo "        magenta $magenta"
	echo "        cyan $cyan"
	echo "        white $white"
	echo "        orange $select"
	echo "    }"
	echo "}"
}

case $choice in 
	Max) echo "$(wal -n -i $ppr && feh --bg-max  $ppr)"
	echo "Setting wallpaper and colors... \n"
	echo "Xft.dpi: 172" > $HOME/.Xresources
	cat $HOME/.cache/wal/colors.Xresources >> $HOME/.Xresources
	xrdb '/home/recur/.Xresources'
	find_colors
	build_alac > $HOME/.config/alacritty/colors.yml
	build_zellij > $HOME/.config/zellij/themes/default.kdl
	echo "Set Wallpaper at Max\nDone :)" ;;

	Fill) echo "$(wal -n -i $ppr && feh --bg-fill  $ppr)"
	echo "Setting wallpaper and colors... \n"
	echo "Xft.dpi: 172" > $HOME/.Xresources
	cat $HOME/.cache/wal/colors.Xresources >> $HOME/.Xresources
	xrdb '/home/recur/.Xresources'
	find_colors
	build_alac  > $HOME/.config/alacritty/colors.yml
	build_zellij > $HOME/.config/zellij/themes/default.kdl
	echo "Set Wallpaper to Fill\nDone :)" ;;

	Test-Fill) echo "$(wal -n -i $ppr && feh --no-fehbg --bg-fill $ppr)"
	echo "Setting wallpaper and colors... \n"
	echo "Testing Wallpaper to Fill\nDone :)" ;;
	
	Test-Max) echo "$(wal -n -i $ppr && feh --no-fehbg --bg-max $ppr)"
	echo "Setting wallpaper and colors... \n"
	echo "Testing Wallpaper at Max\nDone :)" ;;

	*) echo "Error: You have not selected a valid choice"
	exit 1
esac

# For when custom rules become a thing
# sed -i "s/emacs\*background: *\#[0-9a-f]*/emacs\*background:   \#282828/" $HOME/.Xresources
