;; -*- lexical-binding: t -*-

(setq user-full-name "Lucy McPhail"
      user-mail-address "lucy.mcphail.p@gmail.com")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (with-temp-buffer (write-file custom-file)))
(load custom-file)

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa" . "https://melpa.org/packages/")))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)
(setq package-install-upgrade-built-in t)

(add-to-list 'load-path (locate-user-emacs-file "lucy-lisp"))

(when (equal system-type 'darwin) (require 'lucy-mac))

(require 'lucy-essentials)
(require 'lucy-appearance)
(require 'lucy-completion)
(require 'lucy-window)
(require 'lucy-git)
(require 'lucy-mail)
(require 'lucy-org)
(require 'lucy-tex)
(require 'lucy-langs)
(require 'lucy-lsp)
(require 'lucy-writing)
