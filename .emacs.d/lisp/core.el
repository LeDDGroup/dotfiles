(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(show-paren-mode)
(electric-pair-mode)

(setq-default
 auto-save-default nil
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 autoload-file (expand-file-name "loaddefs.el" user-emacs-directory)
 debug-on-error t
 gc-cons-threshold 40000000
 inhibit-startup-screen t
 initial-scratch-message nil
 make-backup-files nil
 ring-bell-function 'ignore
 vc-follow-symlinks t)

(setq-default
 indent-tabs-mode nil
 tab-width 4)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(defalias 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(load autoload-file 'noerror)
