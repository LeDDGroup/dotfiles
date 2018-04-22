(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
; (require 'diminish)
; (require 'bind-key)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1) 
(toggle-scroll-bar -1) 
(tool-bar-mode -1) 

(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

(setq evil-want-C-u-scroll t)

; use-package configuration

(setq use-package-always-ensure t)

(use-package ag)

(use-package nlinum
  :config
  (global-nlinum-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :config
  (evil-mode 1))

(use-package magit)

(use-package evil-magit)

(use-package golden-ratio
  :config
  (golden-ratio-mode 1))

(use-package all-the-icons)

(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter))

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package projectile
  :config
  (projectile-global-mode)
  (setq projectile-keymap-prefix (kbd "SPC p"))
  (setq projectile-completion-system 'grizzl))

(use-package general
  :config
  (general-define-key
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"
    "SPC" `(execute-extended-command :which-key "Run command")
    "g"  '(:ignore t :which-key "Git")
    "gs" '(magit-status :which-key "git status")
    "f"  '(:ignore t :which-key "File")
    "fs" '(save-buffer :which-key "Save file")
    "ff" '(find-file :which-key "Find file")
    "ft" '(neotree :which-key "Open neotree")
    "w"  '(:ignore t :which-key "Window")
    "wk" '(evil-window-up :which-key "Window up")
    "wj" '(evil-window-down :which-key "Window down")
    "wl" '(evil-window-right :which-key "Window right")
    "wh" '(evil-window-left :which-key "Window left")
    "ws" '(evil-window-split :which-key "Window horizontal split")
    "wv" '(evil-window-vsplit :which-key "Window vertical split")
    "wd" '(evil-window-delete :which-key "Window delete")
    "p" 'projectile-command-map))
