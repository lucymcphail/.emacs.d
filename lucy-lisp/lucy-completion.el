;; -*- lexical-binding: t -*-

(setq completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(setq enable-recursive-minibuffers t)

(use-package vertico
  :config
  (vertico-mode t))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
	completion-category-defaults nil
	completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :config
  (marginalia-mode t))

(use-package rg)
(use-package ripgrep)

(use-package consult
  :bind
  (("C-x r b" . consult-bookmark)
   ("C-x M-:" . consult-complex-command)
   ("C-x M-m" . consult-minor-mode-menu)
   ("C-x M-k" . consult-kmacro)
   ([remap goto-line] . consult-goto-line)
   ("M-K" . consult-keep-lines)
   ("M-F" . consult-focus-lines)
   ("M-s M-b" . consult-buffer)
   ("M-s M-e" . consult-flymake)
   ("M-s M-f" . consult-find)
   ("M-s M-g" . consult-ripgrep)
   ("M-s M-i" . consult-imenu)
   ("M-s M-l" . consult-line)
   ("C-x r r" . consult-register))
  :init
  (setq xref-show-xrefs-function #'consult-xref
	xref-show-definitions-function #'consult-xref)
  (setq consult-project-function (lambda (_) (projectile-project-root))))

(use-package consult-dir
  :bind
  (("C-x C-d" . consult-dir)
   :map minibuffer-local-completion-map
   ("C-x C-d" . consult-dir)
   ("C-x C-j" . consult-dir-jump-file))
  :config
  (setq consult-dir-project-list-function #'consult-dir-projectile-dirs))

(use-package company
  :custom
  (company-idle-delay 0.5)
  (company-global-modes '(not eshell-mode shell-mode))
  (company-format-margin-function nil)
  (company-quick-access-keys nil)
  (company-tooltip-minimum-width 40)
  :bind
  (:map company-active-map
	      ("C-n". company-select-next)
	      ("C-p". company-select-previous)
	      ("M-<". company-select-first)
	      ("M->". company-select-last))
  :config
  (global-company-mode t))

(use-package company-posframe
  :hook (company-mode . company-posframe-mode))

(use-package yasnippet
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

(provide 'lucy-completion)
