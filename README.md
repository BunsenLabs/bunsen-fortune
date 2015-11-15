# fortune-mod-crunchbang

A collection of crunchy wisdom from the [crunchbang forums](http://crunchbang.org/forums/).  
To be used as fortune cookies with `fortune`.

# Usage

`fortune crunchbang`

# Dependencies

The `fortune` program, contained in the `fortune-mod` package on most Linux systems.  
Possibly `gnu coreutils` for the `mk.sh` script.  

# Installation

the `mk.sh` script will build the necessary files from the `crunchbang` file and
prompt you to copy them (install) to a directory of your choice.  
This also makes it easier to manually add cookies to the file.
Use `./mk.sh` to execute the build/install script.

# Folded or Not?

Many (classical, old) fortune cookie files are folded to max. 80 chars width.  
I didn't see much sense in doing so, but i have added an option to the script.
You can also choose the max. width to fold, always respecting word boundaries.

# Customization & Changes

Please open an Issue, or post to [this thread](http://crunchbang.org/forums/viewtopic.php?pid=439411)
if you want to add or change something. or make a merge request, or pm me, anything!

# TODO:

* We need more diversity. Short conversations are also welcome, not only quotes from individuals.
* some sort of voting/polling system? or should we just let it grow and grow?
* debian package.
* AUR package.
* maybe, at some point, integration into the [bunsenlabs](http://bunsenlabs.org/) distro (also see [this thread](https://forums.bunsenlabs.org/viewtopic.php?id=644))
