(prelude-require-packages
 '(doom-themes
   ergoemacs-mode
   paredit
   flycheck-clj-kondo
   plantuml-mode
   adoc-mode
   smex
   cider-eval-sexp-fu))

;;; plantuml-mode
(setq org-plantuml-jar-path
      (expand-file-name "/path/to/plantuml.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; zenburn theme -> doom-monokai
;; https://github.com/doomemacs/themes#manually
(disable-theme 'zenburn)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(setq prelude-theme 'doom-monokai-spectrum)
(load-theme 'doom-monokai-spectrum)
(doom-themes-visual-bell-config) ;; Enable flashing mode-line on errors
(doom-themes-org-config) ;; Corrects (and improves) org-mode's native fontific.

;; better highlights of selected region
(custom-set-faces
 '(region ((t (:background "#555042" )))))

;; always reload changed files
(global-auto-revert-mode t)

;; awesome flycheck with clj-kondo!
(require 'flycheck-clj-kondo)

;; highlight what's just been eval'ed etc.
(require 'cider-eval-sexp-fu)

;; ergoemacs - config
(setq ergoemacs-theme "lvl3")
;;(setq ergoemacs-ignore-prev-global nil)
(require 'ergoemacs-mode)

;; JVM options!
(setq cider-clojure-cli-global-options "-J-XX:-OmitStackTraceInFastThrow")

;; Nice! - enable when available (in Emacs 29.1?)
;;(pixel-scroll-precision-mode)

;; if on a MBP, remap the keys to match that of Linux/Windoze
;; See: https://emacsformacosx.com/tips
;; and: https://www.jetbrains.com/lp/mono/
;; or:  https://github.com/tonsky/FiraCode/wiki/Emacs-instructions
(when (equal system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super)
  (setq ns-function-modifier 'control)
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  (when (member "JetBrains Mono" (font-family-list)) ;; Or "Fira Code"
    (add-to-list 'initial-frame-alist '(font . "JetBrains Mono-13")) ;; or "Fira Code-14"
    (add-to-list 'default-frame-alist '(font . "JetBrains Mono-13")))
  ;;(mac-auto-operator-composition-mode)
  (set-fontset-font t 'symbol (font-spec :family "Apple Symbols") nil 'prepend)
  (set-fontset-font t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend))

;; Enable the www ligature in every possible major mode
(ligature-set-ligatures 't '("www"))

;; Enable ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\" "{-" "::"
                                     ":::" ":=" "!!" "!=" "!==" "-}" "----" "-->" "->" "->>"
                                     "-<" "-<<" "-~" "#{" "#[" "##" "###" "####" "#(" "#?" "#_"
                                     "#_(" ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*" "/**"
                                     "/=" "/==" "/>" "//" "///" "&&" "||" "||=" "|=" "|>" "^=" "$>"
                                     "++" "+++" "+>" "=:=" "==" "===" "==>" "=>" "=>>" "<="
                                     "=<<" "=/=" ">-" ">=" ">=>" ">>" ">>-" ">>=" ">>>" "<*"
                                     "<*>" "<|" "<|>" "<$" "<$>" "<!--" "<-" "<--" "<->" "<+"
                                     "<+>" "<=" "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<"
                                     "<~" "<~~" "</" "</>" "~@" "~-" "~>" "~~" "~~>" "%%"))

(global-ligature-mode 't)

;; custom shortcuts
(global-set-key (kbd "<menu>") 'smex)
(global-set-key (kbd "C-k") 'paredit-kill)
(global-set-key (kbd "M-[") 'switch-to-prev-buffer)
(global-set-key (kbd "M-]") 'switch-to-next-buffer)
(global-set-key (kbd "<prior>") 'scroll-down)
(global-set-key (kbd "<next>") 'scroll-up)
(global-set-key (kbd "C-M-l") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-M-j") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-c p s f") 'ag-files)

;; start ergoemacs
(ergoemacs-mode 1)

;; hooks
(add-hook 'clojure-mode-hook 'paredit-mode)

;; hooks
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'flycheck-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq default-directory "~/path/to/project")
