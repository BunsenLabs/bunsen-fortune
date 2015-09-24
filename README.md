# fortune-mod-crunchbang

A collection of crunchy wisdom from the [crunchbang forums](http://crunchbang.org/forums/).  
To be used as fortune cookies with `fortune`.

# Usage

`fortune crunchbang`

# Dependencies

The `fortune` program, contained in the `fortune-mod` package on most Linux systems.  

# Installation

`sudo cp crunchbang crunchbang.dat /usr/share/fortune/`  
or  
`sudo cp crunchbang crunchbang.dat /usr/share/games/fortunes/`

# Folded or Not?

Many (classical, old) fortune cookie files are folded to max. 80 chars width.  
I didn't see much sense in doing so, but i have now added a folded version.  
Which one is better?

# Customization & Changes

Please open an Issue, or post to [this thread](http://crunchbang.org/forums/viewtopic.php?pid=439411)
if you want to add or change something. or make a merge request, or pm me, anything!

You can make changes to your local copy, but then have to regenerate the `crunchbang.dat`
file with `strfile crunchbang`, and re-install.

# TODO:

* We need more diversity. Short conversations are also welcome, not only quotes from individuals.
* some sort of voting/polling system? or should we just let it grow and grow?
* debian package.
* AUR package.
* maybe, at some point, integration into the [bunsenlabs](http://bunsenlabs.org/) distro.
