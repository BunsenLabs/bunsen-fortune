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
	if [[ "x$2" == "x" ]]
	then
		defaultstring="no default"
	else
		defaultstring="Enter=$2"
	fi
	while true
	do
	read -p "Your choice ($defaultstring): " input
		for i in $1 ; do
			if [[ "$input" == "$i" ]]
			then
				echo "$i"
				break 2
			fi
		done
		if [[ "$input" == "" ]] && [[ "x$2" != "x" ]]
		then
			echo "$2"
			break
		fi
	done
}

mkdir -p build

choices="f n"
echo "Do you want to build the folded or the normal version ($choices)?"
case "$(get_input "$choices" f)" in
	f) FLD="$(which fold)"
		if [[ "x$FLD" == "x" ]] ; then
			echo "fold is not found in \$PATH. This most probably means that coreutils is not installed. Cannot continue."
			exit 1
		fi
		echo "How many columns (1-160)?"
		buildfile="build/cbbl-folded"
		installfile="build/cbbl-folded.dat"
		$FLD -s -w "$(get_input "$(seq -s' ' 160)" 80)" cbbl > "$buildfile"
	;;
	n) buildfile="build/cbbl"
		installfile="build/cbbl.dat"

	;;
esac

# building the fortune-mod database
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
Copying $buildfile to $input/cbbl"
	sudo -u "$user" cp -i "$buildfile" "$input/cbbl"
	echo "Copying $installfile to $input/cbbl.dat"
	sudo -u "$user" cp -i "$installfile" "$input/cbbl.dat"
fi

