(use-package magit
  :commands magit-status
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package evil-magit
  :after (magit))

(use-package git-timemachine
  :commands git-timemachine
  :after (magit))

(use-package diff-hl
  :hook (prog-mode . diff-hl-mode))
