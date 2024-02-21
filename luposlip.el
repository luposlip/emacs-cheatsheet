(prelude-require-packages
 '(;;doom-themes
   kaolin-themes
   paredit
   ;;flycheck-clj-kondo
   plantuml-mode
   adoc-mode
   smex
   clj-refactor
   cider-eval-sexp-fu
   clj-deps-new
   ergoemacs-mode))

;;; plantuml-mode
(setq org-plantuml-jar-path
      (expand-file-name "/Users/luposlip/Downloads/plantuml-1.2023.10.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; zenburn theme -> mine!
;; considered: doom-gruvbox, doom-ir-black,
;;             doom-monokai-pro, doom-monokai-spectrum,
;;             doom-monokai-machine, doom-old-hope,
;;             kaolin-bubblebum, kaolin-galaxy,
;;             kaolin-ocean,kaolin-valley-dark
;; https://github.com/doomemacs/themes#manually

(disable-theme 'zenburn)

(setq prelude-theme 'kaolin-bubblegum)
(load-theme 'kaolin-bubblegum)

;; better highlights of selected region
;;(custom-set-faces
;; '(region ((t (:background "#555042" )))))

;; always reload changed files
(global-auto-revert-mode t)

;; awesome flycheck with clj-kondo!
;;(require 'flycheck-clj-kondo)

;; highlight what's just been eval'ed etc.
(require 'cider-eval-sexp-fu)

;; ergoemacs - config
(setq ergoemacs-theme "lvl3")
(setq ergoemacs-ignore-prev-global nil)
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
    (add-to-list 'initial-frame-alist '(font . "JetBrains Mono-14")) ;; "Fira Code-14" | "JetBrains Mono-13"
    (add-to-list 'default-frame-alist '(font . "JetBrains Mono-14")))
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
;;(global-set-key (kbd "<menu>") 'smex)
(global-set-key (kbd "C-k") 'paredit-kill)
(global-set-key (kbd "M-[") 'switch-to-prev-buffer)
(global-set-key (kbd "M-]") 'switch-to-next-buffer)
(global-set-key (kbd "<prior>") 'scroll-down)
(global-set-key (kbd "<next>") 'scroll-up)
(global-set-key (kbd "C-M-l") 'sp-forward-slurp-sexp)
(global-set-key (kbd "C-M-j") 'sp-backward-slurp-sexp)
(global-set-key (kbd "C-c p s f") 'ag-files)

;; LSP
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    ;; Danish characters
    ;;(global-set-key (kbd "M-a")  (lambda () (interactive) (insert "å")))
    ;;(define-key map (kbd "M-A")  (lambda () (interactive) (insert "Å")))
    ;;(define-key map (kbd "M-o")  (lambda () (interactive) (insert "ø")))
    ;;(define-key map (kbd "M-O")  (lambda () (interactive) (insert "Ø")))
    ;;(define-key map (kbd "M-'")  (lambda () (interactive) (insert "æ")))
    ;;(define-key map (kbd "M-\"") (lambda () (interactive) (insert "Æ")))
    ;; LSP
    (define-key map (kbd "M-.") 'lsp-find-definition)          ; Jump straight to definition
    (define-key map (kbd "s-.") 'lsp-ui-peek-find-references)  ; Peek definition and references
    (define-key map (kbd "M-,") 'xref-go-back)                 ; Go back to before jump
    (define-key map (kbd "s-,") 'xref-go-forward)              ; Go forward again ...
    map)
    "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes"
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode t)

;; start ergoemacs
(ergoemacs-mode 1)

;; hooks
(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (flycheck-mode 1)
  (paredit-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-r"))

;; hooks
;;(add-hook 'prog-mode-hook 'copilot-mode)

(add-hook 'clojure-mode-hook 'my-clojure-mode-hook)

(add-hook 'cider-repl-mode-hook 'paredit-mode)
;;(add-hook 'org-mode 'paredit-mode)

;;(setq org-babel-clojure-backend 'cider)

;; initial major-mode (for scratch)
(setq initial-major-mode 'clojure-mode)
(setq initial-scratch-message ";; Data all the way..!\n\n")

(setq default-directory "~/meewee/service/")

(use-package lsp-mode
  :ensure t
  :hook ((clojure-mode . lsp)
         (clojurec-mode . lsp)
         (clojurescript-mode . lsp))
  :config
  ;; add paths to your local installation of project mgmt tools, like lein
  ;;(setenv "PATH" (concat
  ;;                "/usr/local/bin" path-separator
  ;;                (getenv "PATH")))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  ;;(setq lsp-clojure-server-command '("/path/to/clojure-lsp"))
  )

  (use-package lsp-ui
    :ensure t
    :commands lsp-ui-mode)

;;(use-package company :ensure t)
(set-frame-parameter nil 'ns-transparent-titlebar nil)
