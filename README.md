## fortune-mod crunchbang/bunsenlabs

A collection of crunchy wisdom from the [crunchbang forums](http://crunchbang.org/forums/)
and from the [bunsenlabs forums](https://forums.bunsenlabs.org/)
(bunsenlabs linux is a community continuation of crunchbang linux).  
To be used as fortune cookies with `fortune`.

## Usage

`fortune cbbl`

If you choose to not install, you have to run it with `fortune build` from the repo's root.

## Dependencies

The `fortune` program, contained in the `fortune-mod` package on most Linux systems.  
Possibly `gnu coreutils` for the `mk.sh` script.  

## Installation

the `mk.sh` script will build the necessary files from the `cbbl` file and
prompt you to copy them (install) to a directory of your choice.  
This also makes it easier to manually add cookies to the file.  
Use `./mk.sh` to execute the build/install script.

## Folded or Not?

Many (classical, old) fortune cookie files are folded to max. 80 chars width.  
I have added this as an option to the script; you can also choose the max.
width to fold, always respecting word boundaries. This can be useful when fortune is used elsewhere than in a terminal emulator (screensaver, ...).

## Customization & Changes

Please open an Issue, or post to [this thread](https://forums.bunsenlabs.org/viewtopic.php?id=644)
if you want to add or change something. or make a merge request, or pm me, anything!

## TODO:

* more quotes/cookies. anything is welcome, really.
* debian package.
* AUR package.
