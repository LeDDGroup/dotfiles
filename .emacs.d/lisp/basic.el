(use-package diminish)

(use-package nlinum
  :config
  (global-nlinum-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (defun evil-backward ()
    (interactive)
    (evil-delete-backward-char 1 1)
    (evil-delete-backward-word))
  (evil-mode 1))

(use-package evil-commentary
  :after (general)
  :commands (evil-commentary)
  :config
  (my-leader-def
    ";" 'evil-commentary))

(use-package evil-escape
  :config
  (setq-default evil-escape-key-sequence "fd")
  (setq-default evil-escape-delay 0.1)
  (evil-escape-mode))

(use-package golden-ratio
  :after (evil)
  :diminish
  :config
  (setq golden-ratio-extra-commands
	(append golden-ratio-extra-commands
		'(evil-window-left
		  evil-window-right
		  evil-window-up
		  evil-window-down)))
  (golden-ratio-mode 1))

(provide 'basic)
