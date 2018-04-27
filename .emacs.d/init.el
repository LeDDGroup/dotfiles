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
    (evil-escape haml-mode restclient git-timemachine exec-path-from-shell diminish benchmark-init flycheck add-node-modules-path a prettier-js diff-hl counsel-projectile counsel ivy tide company zenburn-theme which-key use-package projectile nlinum neotree golden-ratio general fiplr evil-magit evil-leader all-the-icons ag))))

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

(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)

(setq evil-want-C-u-scroll t)

(setq use-package-always-ensure t)

(setq-default indent-tabs-mode nil)

(use-package benchmark-init
  :config
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(use-package ag)

(use-package pug-mode
  :mode "\\.pug\\'")

(use-package haml-mode
  :mode "\\.haml\\'")

(use-package diminish)

(use-package nlinum
  :config
  (global-nlinum-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :config
  (defun evil-backward ()
    (interactive)
    (evil-delete-backward-char 1 1)
    (evil-delete-backward-word))
  (evil-mode 1))

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
  :commands
  (neotree-projectile-action
   neotree-toggle)
  :after (projectile)
  :config
  (setq neo-smart-open nil)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (evil-define-key 'normal neotree-mode-map (kbd "'") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "-") 'neotree-enter-horizontal-split)
  (evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-copy-node)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-select-previous-sibling-node)
  (evil-define-key 'normal neotree-mode-map (kbd "J") 'neotree-select-down-node)
  (evil-define-key 'normal neotree-mode-map (kbd "K") 'neotree-select-up-node)
  (evil-define-key 'normal neotree-mode-map (kbd "L") 'neotree-select-next-sibling-node)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-change-root)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "gr") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "h") 'spacemacs/neotree-collapse-or-up)
  (evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "l") 'spacemacs/neotree-expand-or-open)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "y") 'neotree-copy-filepath-to-yank-ring)
  (evil-define-key 'normal neotree-mode-map (kbd "|") 'neotree-enter-vertical-split)
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
  :hook (prog-mode . flycheck-mode))

(use-package company
  :diminish
  :hook (prog-mode . company-mode))

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

(use-package prettier-js
  :config
  (setq prettier-js-args '(
                           "--config-precedence" "file-override"
                           "--print-width" "100"
                           "--trailing-comma" "all"
                           ))
  )

(use-package restclient
  :commands (restclient-mode))

(use-package add-node-modules-path)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package evil-escape
  :config
  (setq-default evil-escape-key-sequence "fd")
  (setq-default evil-escape-delay 0.1)
  (evil-escape-mode))

(use-package general
  :config
  (evil-define-key 'normal 'with-editor-mode-map ",," 'with-editor-finish)
  (general-define-key
   "C-<tab>" 'previous-buffer
   "C-S-<tab>" 'next-buffer)
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "C-h" 'evil-backward
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line)
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   ":" 'evil-ex
   ";" '(comment-line :which-key "Comment line/lines")
   "SPC" `(execute-extended-command :which-key "Run command")
   "TAB" '(previous-buffer :which-key "Previous buffer")
   "S-<iso-lefttab>" '(next-buffer :which-key "Next buffer")
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
   "fer" '(reload-config :which-key "Reload config File")
   "ff" '(find-file :which-key "Find file")
   "fp" '(neotree-projectile-action :which-key "Neotree project")
   "fs" '(save-buffer :which-key "Save file")
   "ft" '(neotree-toggle :which-key "Toggle neotree")
   "g"  '(:ignore t :which-key "Git")
   "gS" '(magit-stage-file :which-key "git stage")
   "gU" '(magit-unstage-file :which-key "git unstage")
   "gb" '(magit-blame :which-key "git blame")
   "gs" '(magit-status :which-key "git status")
   "gt" '(git-timemachine :which-key "git time machine")
   "h" '(:ignore t :which-key "Help")
   "hK" 'Info-goto-emacs-key-command-node
   "hd" '(:ignore t :which-key "Describe")
   "hdf" 'describe-function
   "hdk" 'describe-key
   "hdm" 'describe-mode
   "hdp" 'describe-package
   "hdv" 'describe-variable
   "hw" 'where-is
   "l"  '(:ignore t :which-key "Line")
   "ls" '(sort-lines :which-key "Sort lines")
   "p" 'projectile-command-map
   "q"  '(:ignore t :which-key "Quit")
   "qq" '(kill-emacs :which-key "Kill emacs")
   "r"  '(:ignore t :which-key "Refactor")
   "rp" '(prettier-js :which-key "Prettierjs")
   "s"  '(:ignore t :which-key "Search")
   "ss" '(swiper :which-key "swiper")
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
   "tr" '(tide-rename-symbol :which-key "rename")
   "w"  '(:ignore t :which-key "Window")
   "wH" '(evil-window-move-far-left :which-key "Move left")
   "wJ" '(evil-window-move-very-bottom :which-key "Move up")
   "wK" '(evil-window-move-very-top :which-key "Move down")
   "wL" '(evil-window-move-far-right :which-key "Move right")
   "wd" '(evil-window-delete :which-key "Delete")
   "wh" '(evil-window-left :which-key "Left")
   "wj" '(evil-window-down :which-key "Down")
   "wk" '(evil-window-up :which-key "Up")
   "wl" '(evil-window-right :which-key "Right")
   "ws" '(evil-window-split :which-key "Horizontal split")
   "wv" '(evil-window-vsplit :which-key "Vertical split")
   )
  )


(setq auto-mode-alist (append '(("\\.js$" . typescript-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.jsx$" . typescript-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.tsx$" . typescript-mode)) auto-mode-alist))
(setq auto-mode-alist (append '(("\\.http$" . restclient-mode)) auto-mode-alist))
(add-hook 'web-mode-hook 'prettier-js-mode)
(setq prettier-js-show-errors 'echo)

(add-to-list 'load-path "~/.emacs.d/layers")
(require 'core)
(require 'spacemacs)
(require 'typescript-layer)
(require 'git-layer)

;;; init.el ends here
