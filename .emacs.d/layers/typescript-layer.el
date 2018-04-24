;;; package --- Sumary
;;; Commentary:
;;; typescript-layer.el
;;; Code:
(use-package tide
  :diminish
  :hook (typescript-mode . setup-tide-mode)
  :init
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save-mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (company-mode +1))
  :config
  (setq company-tooltip-align-annotations t)
  (add-hook 'before-save-hook 'tide-format-before-save)
  )

(provide 'typescript-layer)
;;; typescript-layer.el ends here
