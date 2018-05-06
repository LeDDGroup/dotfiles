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
          (call-interactively 'neotree-enter)))))

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
  (evil-define-key 'normal neotree-mode-map (kbd "|") 'neotree-enter-vertical-split))

(provide 'neotree-layer)
