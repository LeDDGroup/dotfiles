;;; package --- Sumary
;;; Commentary:
;;; typescript-layer.el
;;; Code:
(use-package tide
  :diminish
  :hook (typescript-mode . setup-tide-mode)
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (if (locate-dominating-file default-directory ".prettierrc")
	(prettier-js-mode +1)
      (add-hook 'before-save-hook 'tide-format-before-save))
    (company-mode +1))
  (setq company-tooltip-align-annotations t))

(provide 'typescript-layer)
;;; typescript-layer.el ends here
