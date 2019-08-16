# Luposlip's Emacs/Clojure Cheatsheet

Since I couldn't find any cheatsheets out there for Emacs with ErgoEmacs for Clojure development, I decided to create my own.

So, this is it.

I use Emacs 26.1 (for the moment).

This is my list of Emacs packages:

    ag
    aggressive-indent
    avy
    beacon
    better-defaults
    cider
    clj-refactor
    clojure-mode
    clojure-mode-extra-font-locking
    company
    dash
    ergoemacs-mode
    flx-ido
    ido-completing-read+
    magit
    monokai-theme
    org
    paredit
    projectile
    rainbow-delimiters
    smex
    
You can see my full Emacs `init.el` here:
[https://gist.github.com/luposlip/b2527a99fd175b53aadfecc07a06c16e](https://gist.github.com/luposlip/b2527a99fd175b53aadfecc07a06c16e)

You're most welcome to use and adapt it for your own personal preferences, as long as you share your adaptation with the rest of us (by forking this repo).

## Projectile issues

If you're getting an error from Projectile containing the message `Setting Current Directory`, and the rest of the message contains a path with double slashes, you should probably change the paths in your project root `.projectile` file.

One of my `.projectile` files looks like this:

    +src/clj
    +test

## nREPL issues

If your nRepl won't start because of some not found wrap-refactor, it's probably because of a wrong installed version of clj-refactor. Uninstall that via `package-list-packages` (search for it via `C-f`, then mark it for deletion via a press on `d`, then execute the deletion via a press on `x`. Then install newest "date-versioned" incarnation of `clj-refactor` instead.

## Thanks to 

@korny for inspiration from his "Korny's Emacs/clojure cheatsheet"

## Licence

Copyright © Henrik Mohr 2019

Distributed under [Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) CC Licence
