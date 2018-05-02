;;; package --- Summary
;;; Commentary:
;;; Code:

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq
 inhibit-startup-screen t
 initial-scratch-message nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'core)
;;; core.el ends here
