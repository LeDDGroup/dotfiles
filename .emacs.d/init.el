(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'setup)
(require 'init-benchmark)
(require 'core)
(require 'basic)
(require 'themes)
(require 'init-tabbar)
(require 'init-general)
(require 'others)

(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 110
                    :weight 'normal
                    :width 'normal)

(setq vc-follow-symlinks t)


(use-package all-the-icons
  :commands (neotree-toggle))

(use-package neotree
  :commands
  (neotree-projectile-action
   neotree-toggle)
  :after (projectile)
  :config
  (setq neo-window-fixed-size nil)
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

(use-package projectile
  :diminish
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

(use-package flycheck
  :diminish
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package company
  :diminish
  :hook (prog-mode . company-mode))

(use-package flx)

(use-package ivy
  :diminish
  :config
  (setq ivy-use-selectable-prompt t)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package counsel
  :after (general)
  :commands (counsel-mode)
  :config
  (my-leader-def
    ":" 'counsel-M-x)
  :diminish)

(use-package counsel-projectile
  :after (counsel)
  :commands counsel-projectile-mode)

(use-package prettier-js
  :hook (web-mode-hook . prettier-js-mode)
  :config
  (setq prettier-js-show-errors 'echo)
  (setq prettier-js-args '(
                           "--config-precedence" "prefer-file"
                           "--print-width" "100"
                           "--trailing-comma" "all"
                           )))

(require 'utils "~/.emacs.d/layers/core.el")
(require 'spacemacs "~/.emacs.d/layers/spacemacs.el")
(require 'typescript-layer "~/.emacs.d/layers/typescript-layer.el")
(require 'git-layer "~/.emacs.d/layers/git-layer.el")

(counsel-mode)
(counsel-projectile-mode)
