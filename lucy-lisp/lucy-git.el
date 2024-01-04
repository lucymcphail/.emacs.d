;; -*- lexical-binding: t; -*-

(use-package vc
  :config
  (setq vc-follow-symlinks t))

(use-package projectile
  :defer nil
  :bind
  ("C-c p" . projectile-command-map)
  :custom
  (projectile-mode-line-function
   (lambda ()
     (format " P[%s]" (projectile-project-name))))
  :config
  (projectile-mode t))

(use-package magit
  :bind
  (("C-x g" . magit)
   ("C-x M-g" . magit-dispatch))
  :config
  (require 'magit-diff)
  (setq magit-diff-refine-hunk t)
  (require 'magit-repos))

(use-package magit-todos
  :after magit
  :config
  (magit-todos-mode t))

(use-package diff-hl
  :hook
  ((magit-pre-refresh . diff-hl-magit-pre-refresh)
   (magit-post-refresh . diff-hl-magit-post-refresh))
  :config
  (global-diff-hl-mode t))

(provide 'lucy-git)
