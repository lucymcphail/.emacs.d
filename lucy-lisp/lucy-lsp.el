;; -*- lexical-binding: t -*-

(use-package flycheck
  :bind (:map flycheck-mode-map
	      ("C-c l" . flycheck-list-errors)))

(use-package lsp-mode
  :commands lsp
  :custom
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-inlay-hint-enable t)
  (lsp-lens-enable nil)
  :bind (:map lsp-mode-map
	      ("M-?" . lsp-find-references)
	      ("C-c a" . lsp-execute-code-action)
	      ("C-c r" . lsp-rename))
  :config
  (setq gc-cons-threshold 100000000
	read-process-output-max (* 1024 1024))
  (add-hook 'lsp-mode-hook 'lsp-ui-mode))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-show-hover nil)
  (lsp-ui-doc-enable nil))

(provide 'lucy-lsp)
