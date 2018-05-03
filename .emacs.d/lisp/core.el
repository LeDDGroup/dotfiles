;;; package --- Summary
;;; Commentary:
;;; Code:

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(show-paren-mode)
(electric-pair-mode)

(setq
 auto-save-default nil
 debug-on-error t
 inhibit-startup-screen t
 initial-scratch-message nil
 ring-bell-function 'ignore
 make-backup-files nil)

(setq-default
 indent-tabs-mode nil
 tab-width 4)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'core)
;;; core.el ends here
