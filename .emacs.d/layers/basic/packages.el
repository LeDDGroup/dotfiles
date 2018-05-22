(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package evil-surround
  :hook (prog-mode . evil-surround-mode)
  :config
  (evil-define-key '(normal visual) evil-surround-mode-map "s" 'evil-surround-region))

(use-package evil-commentary
  :commands evil-commentary
  :config
  (my-leader-def
    ";" 'evil-commentary))

(use-package evil-escape
  :config
  (setq-default evil-escape-key-sequence "fd")
  (setq-default evil-escape-delay 0.1)
  (evil-escape-mode))

(use-package general
  :config
  (general-create-definer my-local-leader-def
    :states '(normal visual emacs)
    :prefix "SPC m")
  (general-create-definer my-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC"))

(use-package company
  :diminish
  :config
  (define-key company-active-map (kbd "C-j") 'company-select-next)
  (define-key company-active-map (kbd "C-k") 'company-select-previous)
  :hook (prog-mode . company-mode))

(use-package flx)

(use-package ivy
  :diminish
  :config

  ;; keybindings
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "C-h" 'ivy-backward-kill-word
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line)

  ;; variables
  (setq ivy-use-selectable-prompt t
        ivy-re-builders-alist '((t . ivy--regex-fuzzy))
        ivy-use-virtual-buffers t
        enable-recursive-minibuffers t)

  (ivy-mode 1))

(use-package counsel
  :config
  (counsel-mode)
  :diminish)

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package nlinum
  :config
  (global-nlinum-mode 1))


(use-package diminish)

(use-package undo-tree
  :commands undo-tree-mode
  :diminish)

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

(use-package neotree
  :commands (neotree-projectile-action neotree-toggle)
  :config
  ;; From spacemacs
  (defun spacemacs/neotree-expand-or-open ()
    "Expand or open a neotree node."
    (interactive)
    (let ((node (neo-buffer--get-filename-current-line)))
      (when node
        (if (file-directory-p node)
            (progn
              (neo-buffer--set-expand node t)
              (neo-buffer--refresh t)
              (when neo-auto-indent-point
                (next-line)
                (neo-point-auto-indent)))
          (call-interactively 'custom-neotree-enter)))))

  (defun spacemacs/neotree-collapse ()
    "Collapse a neotree node."
    (interactive)
    (let ((node (neo-buffer--get-filename-current-line)))
      (when node
        (when (file-directory-p node)
          (neo-buffer--set-expand node nil)
          (neo-buffer--refresh t))
        (when neo-auto-indent-point
          (neo-point-auto-indent)))))

  (defun spacemacs/neotree-collapse-or-up ()
    "Collapse an expanded directory node or go to the parent node."
    (interactive)
    (let ((node (neo-buffer--get-filename-current-line)))
      (when node
        (if (file-directory-p node)
            (if (neo-buffer--expanded-node-p node)
                (spacemacs/neotree-collapse)
              (neotree-select-up-node))
          (neotree-select-up-node)))))

  (defun spacemacs//neotree-maybe-attach-window ()
    (when (get-buffer-window (neo-global--get-buffer))
      (neo-global--attach)))

  (defun custom-neotree-enter ()
    (interactive)
    (call-interactively 'neotree-enter)
    (call-interactively 'neotree-hide))
  (setq neo-window-fixed-size nil)
  (setq neo-smart-open nil)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action))

(add-hook 'prog-mode-hook 'hs-minor-mode)
