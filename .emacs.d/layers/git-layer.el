;;; package --- Sumary
;;; Commentary:
;;; git-layer.el
;;; Code:
(use-package magit
  :commands magit-status
  :config
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1))

(use-package evil-magit
  :after (magit))
(provide 'git-layer)

(use-package git-timemachine
  :commands (git-timemachine)
  :after (magit))

(use-package diff-hl
  :config
  (global-diff-hl-mode))
;;; git-layer.el ends here
