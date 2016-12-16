# Luposlip's Emacs/Clojure Cheatsheet

Since I couldn't find any cheatsheets out there for Emacs with ErgoEmacs for Clojure development, I decided to create my own.

So, this is it.

I use Emacs 24.5.1 (for the moment).

This is my list of Emacs packages:

    clojure-mode
    clojure-mode-extra-font-locking
    clj-refactor
    aggressive-indent
    paredit
    paredit-menu
    company
    ido-ubiquitous
    flx-ido
    rainbow-delimiters
    monokai-theme
    smex
    cider
    projectile
    better-defaults
    magit
    ergoemacs-mode

You can see my full Emacs `init.el` here:
[https://gist.github.com/luposlip/b2527a99fd175b53aadfecc07a06c16e](https://gist.github.com/luposlip/b2527a99fd175b53aadfecc07a06c16e)

You're most welcome to use and adapt it for your own personal preferences, as long as you share your adaptation with the rest of us (by forking this repo).

## Projectile issues

If you're getting an error from Projectile containing the message `Setting Current Directory`, and the rest of the message contains a path with double slashes, you should probably change the paths in your project root `.projectile` file.

One of my `.projectile` files looks like this:

    +src/clj
    +test


## Thanks to 

@korny for inspiration from his "Korny's Emacs/clojure cheatsheet"

## Licence

Copyright © luposlip 2016

Distributed under [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) CC Licence
