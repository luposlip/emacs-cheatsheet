# Luposlip's Emacs/Clojure Cheatsheet

Since I couldn't find any cheatsheets out there for Emacs with ErgoEmacs for Clojure development, I decided to create my own.

So, this is it.

I use Emacs 25.2.2 (for the moment).

NOTE: Some of my keyboard shortcuts (such as slurp forward) doesn't work with versions of ergoemacs-mode newer than `    20161206.1258`!!

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
    ag

You can see my full Emacs `init.el` here:
[https://gist.github.com/luposlip/b2527a99fd175b53aadfecc07a06c16e](https://gist.github.com/luposlip/b2527a99fd175b53aadfecc07a06c16e)

You're most welcome to use and adapt it for your own personal preferences, as long as you share your adaptation with the rest of us (by forking this repo).

## Projectile issues

If you're getting an error from Projectile containing the message `Setting Current Directory`, and the rest of the message contains a path with double slashes, you should probably change the paths in your project root `.projectile` file.

One of my `.projectile` files looks like this:

    +src/clj
    +test

## nREPL issues

If your nRepl won't start because of some not found wrap-refactor, it's probably because of a wrong installed version of clj-refactor. Uninstall that via `package-list-packages` (search for it via `C-f`, then mark it for deletion via a press on `d`, then execute the deletion via a press on `x`.

## Thanks to 

@korny for inspiration from his "Korny's Emacs/clojure cheatsheet"

## Licence

Copyright © luposlip 2016-2017

Distributed under [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) CC Licence
