(prelude-require-packages
 '(monokai-theme
   ergoemacs-mode
   rainbow-delimiters
   cider-eval-sexp-fu
   flycheck-clj-kondo))

;; zenburn -> monokai
(disable-theme 'zenburn)
(setq prelude-theme 'monokai)
(load-theme 'monokai t)

;; always reload changed files
(global-auto-revert-mode t)

;; awesome flycheck with clj-kondo!
(require 'flycheck-clj-kondo)

;; highlight what's just been eval'ed etc.
(require 'cider-eval-sexp-fu)

;; ergoemacs - config
(setq ergoemacs-theme "lvl2")
(setq ergoemacs-ignore-prev-global nil)
(require 'ergoemacs-mode)

;; custom shortcuts
(global-set-key (kbd "<menu>") 'smex)
(global-set-key (kbd "C-k") 'paredit-kill)
(global-set-key (kbd "M-[") 'switch-to-prev-buffer)
(global-set-key (kbd "M-]") 'switch-to-next-buffer)
(global-set-key (kbd "<prior>") 'scroll-down)
(global-set-key (kbd "<next>") 'scroll-up)

;; start ergoemacs
(ergoemacs-mode 1)

;; clojure mode hooks
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook 'smartparens-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'clojure-mode-hook 'flycheck-mode)

;; cider-mode hooks
(add-hook 'cider-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'smartparens-mode)

;; cider-repl-mode
(add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-repl-mode-hook 'smartparens-mode)

(setq default-directory "~/skm/data-flix/tidlig-udsendelse")
