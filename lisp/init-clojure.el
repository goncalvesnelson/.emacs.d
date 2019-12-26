;; init-clojure.el --- Initialize clojure configurations. -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Clojure configuration.
;;

;;; Code:

(eval-when-compile
  (require 'init-custom))

(use-package clojure-mode-extra-font-locking)
(use-package paredit)

(use-package clojure-mode
  :config

  ;; enable paredit for Clojure
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)

  ;; useful for working with camel-case tokens, like
  ;; names of Java classes (e.g. JavaClassName)
  (add-hook 'clojure-mode-hook 'subword-mode)
  (add-hook 'clojure-mode-hook #'company-mode)

  ;; more syntax highlighting
  (require 'clojure-mode-extra-font-locking)

  (add-hook 'clojure-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'clojure-mode-hook
	    (lambda ()
	      (setq inferior-lisp-program "lein repl")
	      (rainbow-delimiters-mode)))

  ;;use clojure mode for other extensions
  (add-to-list 'auto-mode-alist '("\\.edn$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.boot$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("\\.cljs.*$" . clojure-mode))
  (add-to-list 'auto-mode-alist '("lein-env" . enh-ruby-mode)))

(use-package cider
  :config
  (add-hook 'cider-mode-hook 'turn-on-eldoc-mode)
  (add-hook 'cider-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-mode-hook #'company-mode)
  (add-hook 'cider-repl-mode-hook #'company-mode)

  (setq cider-repl-pop-to-buffer-on-connect t
	cider-show-error-buffer t
	cider-auto-select-error-buffer t
	cider-repl-history-file "~/.emacs.d/cider-history"
	cider-repl-wrap-history t))

(provide 'init-clojure)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-clojure.el ends here
