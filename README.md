# Luposlip's Emacs/Clojure Cheatsheet

If you're interested in my [old setup using plain emacs, see here](old-setup-plain-emacs.md).

I've recently (October 2021) started using @bbatsov's [Prelude](https://github.com/bbatsov/prelude).

So my setup is much simpler now. I just add my [luposlip.el](luposlip.el) to my
`~/.emacs.d/personal` folder, and that's it.

I'm still using a subset of [ergoemacs](https://ergoemacs.github.io), but
instead of the full blown ergoemacs-mode, I use the limited [`lvl2`](https://ergoemacs.github.io/gradual-adoption.html)
theme to preserve as many as the great Prelude defaults as possible, and still
keeping my sanity with `C-c` (copy), `C-v` (paste), `C-z` (undo), `M-s` (switch buffer)
and navigation with `M-i` (line up), `M-k` (line down), `M-j` (char left) and
M-l (char right) plus a few others defaults:
[ergoemacs standard shortcuts](https://ergoemacs.github.io/standard-shortcuts.html).

Remember to enable the Prelude module for `clojure` development under:
`.emacs.d/personal/prelude-modules.el`!

## Building Emacs

1. Download latest Emacs, or pull from github
2. cd into the emacs source folder
3. `sudo apt install build-essential libgtk-3-dev libgnutls28-dev libtiff5-dev libgif-dev libjpeg-dev libpng-dev libxpm-dev libncurses-dev texinfo mail-utils libgccjit-11-dev`
4. `./autogen.sh`
5. `./configure --with-native-compilation --with-mailutils`
6. `make -j8`
7. `sudo make install`

## Thanks to

@bbatsov for all his great work for the Clojure community!

## Licence

Copyright © Henrik Mohr 2016-2023

Distributed under [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) CC Licence
