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

;; Auto-complete 
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(require 'auto-complete-config)
(ac-config-default)

;; SystemC macros

(fset 'sc-convert-cons
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote (" > ;w(\"\");," 0 "%d")) arg)))

;; Remove toolbar & menu bar

(menu-bar-mode -1)
(tool-bar-mode -1)

;; Remove startup help screen.
(setq inhibit-startup-message t)

;; Set font and color stuff.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("0603fb5696ab4af05e7c8bb11498bd189bdb7930c7c88dd6ac1e5ec2fc3efb2b" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 101 :width normal)))))
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn' t)
