;; -*- lexical-binding: t -*-

(setq frame-title-format "%b")

(line-number-mode t)
(column-number-mode t)
(show-paren-mode t)

(use-package modus-themes
  :bind ("C-c t" . modus-themes-toggle)
  :defer nil
  :config
  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t
	modus-themes-common-palette-overrides
	'((fringe nil)
	  (comment magenta-faint))
	modus-vivendi-palette-overrides
	'((bg-mode-line-active bg-magenta-subtle)
	  (bg-main "#101010"))
	modus-operandi-palette-overrides
	'((bg-mode-line-active bg-magenta-intense))
	modus-themes-to-toggle
	'(modus-vivendi modus-operandi))
  (modus-themes-load-vivendi))

(use-package minions
  :config
  (setq minions-mode-line-lighter ";")
  (setq minions-prominent-modes
	(list 'defining-kbd-macro
	      'narrow-mode
	      'flymake-mode
	      'flycheck-mode
	      'projectile-mode))
  (minions-mode t))

(use-package fontaine
  :bind
  (("C-c f" . #'fontaine-set-preset)
   ("C-c F" . #'fontaine-set-face-font))
  :defer nil
  :config
  (setq x-underline-at-descent-line t)
  (setq fontaine-presets
	'((regular
	   :default-family "Iosevka Term"
	   :default-height 120
	   :default-weight regular
	   :variable-pitch-family "Inter")
	  (presentation
	   :default-family "Iosevka Term"
	   :default-height 240
	   :default-weight regular
	   :variable-pitch-family "Inter")))
  (fontaine-set-preset 'regular))

(provide 'lucy-appearance)
