## fortune-mod crunchbang/bunsenlabs

A collection of crunchy wisdom from the [crunchbang forums](http://crunchbang.org/forums/)
and from the [bunsenlabs forums](https://forums.bunsenlabs.org/)
(bunsenlabs linux is a community continuation of crunchbang linux).  
To be used as fortune cookies with `fortune`.

## Usage

`fortune cbbl`

There's also a script in `bl/bl-fortune` that can be invoked to send notifications with random quotes. Please see `bl/bl-fortune -h` for more info.

If you choose to not install this package, you have to run it with `fortune build` from the repo's root (see Installation).

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

## Rules for adding new quotes

- must come from BL or crunchbang forum (we'd love some more #! forum items!)
- must work out of context
- must be original, meaning it must not be another person's re-quote.
- must be family friendly or safe for work or whatever that's usually called - but since BL forum is family friendly anyhow that goes without saying. And don't take this too strictly ;)

It does __not__ have to be a joke, It can be quoteworthy for many reasons. Fell free, we add what _you_ want, not what this repo's maintainer wants!
