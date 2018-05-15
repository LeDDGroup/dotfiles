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


(provide 'basic)
