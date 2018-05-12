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

(use-package git-timemachine
  :commands git-timemachine
  :after (magit))

;; @see https://bitbucket.org/lyro/evil/issue/511/let-certain-minor-modes-key-bindings
(eval-after-load 'git-timemachine
  '(progn
     (evil-make-overriding-map git-timemachine-mode-map 'normal)
     ;; force update evil keymaps after git-timemachine-mode loaded
     (add-hook 'git-timemachine-mode-hook #'evil-normalize-keymaps)))

(use-package diff-hl
  :hook (prog-mode . diff-hl-mode))

(provide 'git-layer)
;;; git-layer.el ends here
