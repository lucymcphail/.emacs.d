;; -*- lexical-binding: t -*-

(use-package editorconfig
  :config
  (editorconfig-mode t))

(use-package treesit-auto
  :config
  (global-treesit-auto-mode))

(use-package python
  :config
  (setq python-indent-def-block-scale 1))

(use-package haskell-mode
  :hook (haskell-mode . interactive-haskell-mode)
  :init
  (require 'haskell-interactive-mode)
  (require 'haskell-process))

(use-package rustic
  :custom
  (lsp-rust-analyzer-max-inlay-hint-length 40)
  (lsp-rust-analyzer-display-chaining-hints t)
  (lsp-rust-analyzer-display-closure-return-type-hints t)
  (lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
  (lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
  (lsp-rust-analyzer-display-parameter-hints t)
  (lsp-rust-analyzer-display-reborrow-hints nil))

(use-package elisp-slime-nav
  :hook ((emacs-lisp-mode ielm-mode) . elisp-slime-nav-mode))

(use-package slime
  :config
  (require 'slime-autoloads)
  (slime-setup '(slime-fancy))
  (setq slime-net-coding-system 'utf-8-unix)
  (setq inferior-lisp-program "sbcl"))

(provide 'lucy-langs)
