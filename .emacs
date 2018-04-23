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
  (projectile-mode)
  (setq projectile-completion-system 'grizzl))

(use-package flycheck
  :init
  (global-flycheck-mode)
  )

(use-package company)

(use-package general
  :config
  (general-define-key
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"
    "SPC" `(execute-extended-command :which-key "Run command")
    "b"  '(:ignore t :which-key "Buffer")
    "bd" '(kill-buffer :which-key "Kill buffer")
    "bn" '(next-buffer :which-key "Next buffer")
    "bp" '(previous-buffer :which-key "Previous buffer")
    "e"  '(:ignore t :which-key "Error")
    "eb" '(eval-buffer :which-key "Eval buffer")
    "en" '(flycheck-next-error :which-key "Flycheck next error")
    "ep" '(flycheck-previous-error :which-key "Flycheck previous error")
    "f"  '(:ignore t :which-key "File")
    "ff" '(find-file :which-key "Find file")
    "fs" '(save-buffer :which-key "Save file")
    "ft" '(neotree :which-key "Open neotree")
    "g"  '(:ignore t :which-key "Git")
    "gs" '(magit-status :which-key "git status")
    "l"  '(:ignore t :which-key "Line")
    "ls" '(sort-lines :which-key "Sort lines")
    "p" 'projectile-command-map
    "w"  '(:ignore t :which-key "Window")
    "wd" '(evil-window-delete :which-key "Window delete")
    "wh" '(evil-window-left :which-key "Window left")
    "wj" '(evil-window-down :which-key "Window down")
    "wk" '(evil-window-up :which-key "Window up")
    "wl" '(evil-window-right :which-key "Window right")
    "ws" '(evil-window-split :which-key "Window horizontal split")
    "wv" '(evil-window-vsplit :which-key "Window vertical split")
    )
  )
