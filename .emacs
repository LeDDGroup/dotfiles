(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (tide company zenburn-theme which-key use-package projectile nlinum neotree golden-ratio general fiplr evil-magit evil-leader all-the-icons ag))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq make-backup-files nil)
(setq auto-save-default nil)

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
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "'") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-change-root)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "x") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "y") 'neotree-copy-filepath-to-yank-ring)
  )

(use-package zenburn-theme
  :config
  (load-theme 'zenburn t))

(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-completion-system 'grizzl))

(use-package flycheck
  :config
  (global-company-mode))

(use-package company
  :config
  (global-company-mode))

(use-package tide
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save-mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(defun open-scratch-buffer ()
  (interactive)
  (switch-to-buffer "scratch"))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(use-package general
  :config
  (general-define-key
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"
    "SPC" `(execute-extended-command :which-key "Run command")
    "a"  '(:ignore t :which-key "Applications")
    "ac" '(calc :which-key "Calc")
    "ad" '(dired :which-key "Dired")
    "b"  '(:ignore t :which-key "Buffer")
    "bd" '(kill-current-buffer :which-key "Kill buffer")
    "bn" '(next-buffer :which-key "Next buffer")
    "bp" '(previous-buffer :which-key "Previous buffer")
    "bs" '(open-scratch-buffer :which-key "Scratch buffer")
    "e"  '(:ignore t :which-key "Error")
    "eb" '(eval-buffer :which-key "Eval buffer")
    "en" '(next-error :which-key "Next error")
    "ep" '(previous-error :which-key "Previous error")
    "f"  '(:ignore t :which-key "File")
    "ff" '(find-file :which-key "Find file")
    "fs" '(save-buffer :which-key "Save file")
    "ft" '(neotree-toggle :which-key "Toggle neotree")
    "g"  '(:ignore t :which-key "Git")
    "gs" '(magit-status :which-key "git status")
    "l"  '(:ignore t :which-key "Line")
    "ls" '(sort-lines :which-key "Sort lines")
    "p" 'projectile-command-map
    "t"  '(:ignore t :which-key "Toggle")
    "tm"  '(:ignore t :which-key "Mode")
    "tmc" '(company-mode :which-key "Company")
    "tmf" '(flycheck-mode :which-key "Flycheck")
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
