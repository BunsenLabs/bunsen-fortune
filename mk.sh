#!/bin/bash

sep="================================================================================"
echo "I will build the files necessary for fortune-mod, and optionally install them.
$sep"

get_input() {
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
	read -p "=> your choice (Enter=$2): " input
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

STRF="$(which strfile)"
[[ "$STRF" == "" ]] && echo "strfile is not found in \$PATH. This most probably means that fortune-mod is not installed. Cannot continue." && exit 1

sourcefile="./cbbl"
[[ "$(file -b --mime-type "$sourcefile")" != "text/plain" ]] && echo "The file $sourcefile cannot be found or is not a plain text file. Are you sure you are calling this script from the fortune-mod-cbbl repo base directory?" && exit 1

mkdir -p build

buildfile="./build/cbbl"
datfile="./build/cbbl.dat"

cp -f "$sourcefile" "$buildfile"

choices="f n"
echo "Do you want to build the folded or the normal version ($choices)?"
case "$(get_input "$choices" f)" in
	f) FLD="$(which fold)"
		if [[ "x$FLD" == "x" ]] ; then
			echo "fold is not found in \$PATH. This most probably means that coreutils is not installed. Cannot continue."
			exit 1
		fi
		echo "How many columns (1-160)?"
		$FLD -s -w "$(get_input "$(seq -s' ' 160)" 80)" cbbl > "$buildfile"
	;;
	n) true
	;;
esac

echo "
$sep
building the fortune-mod database
$STRF $buildfile $datfile"

$STRF "$buildfile" "$datfile" || exit 1

# optional: install
installpath="/usr/share/games/fortunes"
choices="y n"
echo "$sep

Done. Do you want to install the two files $buildfile $datfile
to a directory of your choice?

If you do NOT install, you have to call fortune with the path to the folder
containing the compiled cookies, e.g. 
\"fortune $PWD/build\" or 
\"fortune $PWD/build/cbbl\".

If you DO install, you should install it to a path where the fortune program can
find it.

On debian systems, this is $installpath, on other systems it might be
/usr/share/fortune or something else.

So, do you want to install (y/n)?"

if [[ "$(get_input "$choices" n)" == "y" ]]
then
	input=""
	echo "Please enter install path - must be an existing directory."
	while [ ! -d "$input" ]
	do
		read -p "=> your choice (Enter=$installpath): " input
		[[ "x$input" == "x" ]] && input="$installpath"
	done
	user="$($(which ls) -ld "$input" | awk '{print $3}')"
	echo "$sep
Copying $buildfile to $input/cbbl"
	sudo -u "$user" cp -i "$buildfile" "$input/cbbl"
	echo "Copying $datfile to $input/cbbl.dat"
	sudo -u "$user" cp -i "$datfile" "$input/cbbl.dat"
else
	echo "Not installing."
fi
echo "Done. Here's a taste:
$sep"
fortune build/cbbl
echo "$sep"