;;; package --- Summary
;;; Commentary:
(require 'package)
;;; Code:
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
(scroll-bar-mode -1)
(tool-bar-mode -1)

(defalias 'yes-or-no-p 'y-or-n-p)
(setq ring-bell-function 'ignore)

(setq vc-follow-symlinks t)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq initial-buffer-choice t)
(setq initial-scratch-message nil)

(setq evil-want-C-u-scroll t)


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
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  )

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
  (setq neo-smart-open t)
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
  :hook (prog-mode . flycheck-mode)
  :diminish
  )

(use-package company
  :hook (prog-mode . company-mode)
  :diminish
  )

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

(use-package add-node-modules-path)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package git-timemachine)

(use-package restclient)

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
   "el" '(flycheck-list-errors :which-key "List errors")
   "en" '(next-error :which-key "Next error")
   "ep" '(previous-error :which-key "Previous error")
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
   "gt" '(git-timemachine :which-key "git time machine")
   "l"  '(:ignore t :which-key "Line")
   "ls" '(sort-lines :which-key "Sort lines")
   "p" 'projectile-command-map
   "q"  '(:ignore t :which-key "Quit")
   "qq" '(kill-emacs :which-key "Kill emacs")
   "r"  '(:ignore t :which-key "Refactor")
   "rp" '(prettier-js :which-key "Prettierjs")
   "t"  '(:ignore t :which-key "Toggle/Typescript")
   "td" '(tide-jump-to-definition :which-key "jump to definition")
   "te"  '(:ignore t :which-key "Error")
   "tel" '(tide-project-errors :which-key "list")
   "ten" '(tide-next-error-function :which-key "next")
   "tep" '(tide-find-previous-error :which-key "previous")
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
   )
  )

(add-to-list 'load-path "~/.emacs.d/layers")
(require 'core)
(require 'typescript-layer)

;;; .emacs ends here
