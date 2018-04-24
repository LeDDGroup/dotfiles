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
    (diminish benchmark-init flycheck add-node-modules-path a prettier-js diff-hl counsel-projectile counsel ivy tide company zenburn-theme which-key use-package projectile nlinum neotree golden-ratio general fiplr evil-magit evil-leader all-the-icons ag))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq vc-follow-symlinks t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

(setq evil-want-C-u-scroll t)

; use-package configuration

(setq use-package-always-ensure t)

(use-package benchmark-init
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package ag)

(use-package diminish)

(use-package nlinum
  :config
  (global-nlinum-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :config
  (evil-mode 1))

(use-package magit
  :commands magit-status
  :config
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  (defun display-buffer-full-screen (buffer alist)
    (delete-other-windows)
    (set-window-dedicated-p nil nil)
    (set-window-buffer nil buffer)
    (get-buffer-window buffer))
  (setq magit-display-buffer-function
	(lambda (buffer)
	  (if magit-display-buffer-noselect
	      (magit-display-buffer-traditional buffer)
	    (display-buffer buffer '(display-buffer-full-screen))))))

(use-package evil-magit
  :after (magit))

(use-package golden-ratio
  :diminish
  :config
  (setq golden-ratio-extra-commands
	(append golden-ratio-extra-commands
		'(evil-window-left
		  evil-window-right
		  evil-window-up
		  evil-window-down)))
  (golden-ratio-mode 1))

(use-package all-the-icons)

(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (evil-define-key 'normal neotree-mode-map (kbd "'") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-copy-node)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
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
  :diminish
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

(use-package flycheck
  :diminish
  :config
  (global-company-mode))

(use-package company
  :diminish
  :config
  (global-company-mode))

(use-package tide
  :diminish
  :hook (typescript-mode . setup-tide-mode)
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
  (add-hook 'before-save-hook 'tide-format-before-save))

(use-package ivy
  :diminish
  :ensure t
  :config
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package counsel
  :diminish
  :config
  (counsel-mode t))

(use-package counsel-projectile
  :config
  (counsel-projectile-mode t))

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(use-package prettier-js)

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
   "el" '(flycheck-list-errors :which-key "List errors")
   "r"  '(:ignore t :which-key "Refactor")
   "rp" '(prettier-js :which-key "Prettierjs")
   "f"  '(:ignore t :which-key "File")
   "fe"  '(:ignore t :which-key "Emacs")
   "fed" '(edit-config :which-key "Config File")
   "fer" '(reload-config :which-key "Config File")
   "ff" '(find-file :which-key "Find file")
   "fp" '(neotree-projectile-action :which-key "Neotree project")
   "fs" '(save-buffer :which-key "Save file")
   "ft" '(neotree-toggle :which-key "Toggle neotree")
   "g"  '(:ignore t :which-key "Git")
   "gb" '(magit-blame :which-key "git blame")
   "gs" '(magit-status :which-key "git status")
   "l"  '(:ignore t :which-key "Line")
   "ls" '(sort-lines :which-key "Sort lines")
   "p" 'projectile-command-map
   "q"  '(:ignore t :which-key "Quit")
   "qq" '(kill-emacs :which-key "Kill emacs")
   "t"  '(:ignore t :which-key "Toggle")
   "tm"  '(:ignore t :which-key "Mode")
   "tmc" '(company-mode :which-key "Company")
   "tmf" '(flycheck-mode :which-key "Flycheck")
   "tmp" '(prettier-js-mode :which-key "Prettier js")
   "w"  '(:ignore t :which-key "Window")
   "wd" '(evil-window-delete :which-key "Window delete")
   "wh" '(evil-window-left :which-key "Window left")
   "wj" '(evil-window-down :which-key "Window down")
   "wk" '(evil-window-up :which-key "Window up")
   "wl" '(evil-window-right :which-key "Window right")
   "ws" '(evil-window-split :which-key "Window horizontal split")
   "wv" '(evil-window-vsplit :which-key "Window vertical split")
   ))

(use-package add-node-modules-path)

(load-file "~/.emacs.d/core.el")
