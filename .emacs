(add-to-list 'load-path "~/.emacs.d/")

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode)) 

;; Maximum colors

(setq font-lock-maximum-decoration t)

(setq frame-background-mode 'dark)

;; Backup protocol

(setq backup-directory-alist `(("." . "~/.saves")))

(setq backup-by-copying t)

(ido-mode t)

;; Benjamins anbefalinger!

(global-set-key (kbd "M-s") 'other-window)

(global-set-key (kbd "M-3") 'split-window-horizontally)

(global-set-key (kbd "M-2") 'split-window-vertically)

;; Endre kill line til å ta hele linja

(global-set-key (kbd "C-k") 'kill-whole-line)

;; Assosiere .ac med C-mode.

(add-to-list 'auto-mode-alist '("\\.ac$" . c-mode))

(setq-default indent-tabs-mode t)
(setq tab-width 8)

(defvaralias 'c-basic-offset 'tab-width)

;; Inkludere flere package repos.

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
  )
