;; (use-package general
;;   :config
;;   (mapc (lambda (i)
;;           (fset (intern (concat "goToBuffer" (number-to-string i)))
;;                 (eval `(lambda ()
;;                          (interactive)
;;                          (goToBuffer (- ,i 1))))))
;;         (number-sequence 1 9))
;;   (general-define-key
;;    :keymaps 'projectile-command-map
;;    "t" 'neotree-projectile-action))

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

(provide 'basic)
