#!/bin/bash

sep="================================================================================"
echo "I will build the files necessary for fortune-mod, and optionally install them.
$sep"

STRF="$(which strfile)"
if [[ "x$STRF" == "x" ]] ; then
	echo "strfile is not found in \$PATH. This most probably means that fortune-mod is not installed. Cannot continue."
	exit 1
fi

function get_input {
	# $1: list of choices
	# $2: default, if the user presses return (ignored if empty)
	default="$2"
	[[ "x$default" == "x" ]] && default="none"
	while true
	do
	read -p "Your choice (Enter=$default): " input
		for i in $1 ; do
			if [[ "$input" == "$i" ]]
			then
				echo "$i"
				break 2
			fi
		done
		if [[ "$input" == "" ]] && [[ "$default" != "none" ]]
		then
			echo "$default"
			break
		fi
	done
}

choices="f n"
echo "Do you want to build the folded or the normal version ($choices)?"
case "$(get_input "$choices" n)" in
	f) FLD="$(which fold)"
		if [[ "x$FLD" == "x" ]] ; then
			echo "fold is not found in \$PATH. This most probably means that coreutils is not installed. Cannot continue."
			exit 1
		fi
		echo "How many columns (1-160)?"
		buildfile="build/crunchbang-folded"
		$FLD -s -w "$(get_input "$(seq -s' ' 160)" 80)" crunchbang > "$buildfile"
	;;
	n) buildfile="crunchbang"
	;;
esac

# building the fortune-mod database
installfile="build/crunchbang.dat"
$STRF "$buildfile" "$installfile"

# optional: install
installpath="/usr/share/fortune"
choices="y n"
echo "$sep
Do you want to install to a directory of your choice ($choices)?"
if [[ "$(get_input "$choices" n)" == "y" ]]
then
	input=""
	while [ ! -d "$input" ]
	do
		read -p "Please enter install path (Enter=$installpath): " input
		[[ "x$input" == "x" ]] && input="$installpath"
	done
	user="$($(which ls) -ld "$input" | awk '{print $3}')"
	echo "$sep
Copying $buildfile to $installpath/crunchbang"
	sudo -u "$user" cp -i "$buildfile" "$installpath/crunchbang"
	echo "Copying $installfile to $installpath/crunchbang.dat"
	sudo -u "$user" cp -i "$installfile" "$installpath/crunchbang.dat"
fi

