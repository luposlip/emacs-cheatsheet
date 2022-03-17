(prelude-require-packages
 '(doom-themes
   ergoemacs-mode
   company
   paredit
   smex
   rainbow-delimiters
   cider-eval-sexp-fu
   flycheck-clj-kondo
   plantuml-mode))

;; plantuml-mode
(setq org-plantuml-jar-path (expand-file-name "/home/luposlip/Downloads/plantuml.jar"))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))

;; Themes below

;; zenburn -> darkburn
;;(setq zenburn-override-colors-alist
;;      '(("zenburn-bg"  . "#111111")))
;;(load-theme 'zenburn t)

;; zenburn -> doom
;; https://github.com/doomemacs/themes#manually
(disable-theme 'zenburn)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled
(setq prelude-theme 'doom-monokai-spectrum) ;; or doom-molokai
(load-theme 'doom-monokai-spectrum) ;; or doom-molokai
(doom-themes-visual-bell-config) ;; Enable flashing mode-line on errors
(doom-themes-neotree-config) ;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-org-config) ;; Corrects (and improves) org-mode's native fontification.

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

;; Nice!
(pixel-scroll-precision-mode)

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

;; clojure mode hooks
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'flycheck-mode)

;; cider-mode hooks
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-mode-hook 'smartparens-mode)

;; cider-repl-mode
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(setq default-directory "~/path/to/project")
