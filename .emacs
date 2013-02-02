;; Maximum colors

(setq font-lock-maximum-decoration t)

(setq frame-background-mode 'dark)

;; Backup protocol

(setq backup-directory-alist `(("." . "~/.saves")))

(setq backup-by-copying t)

(ido-mode t)

(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;; Benjamins anbefalinger!

(global-set-key (kbd "M-s") 'other-window)

(global-set-key (kbd "M-3") 'split-window-horizontally)

(global-set-key (kbd "M-2") 'split-window-vertically)
