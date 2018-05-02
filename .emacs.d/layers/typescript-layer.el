;;; package --- Sumary
;;; Commentary:
;;; typescript-layer.el
;;; Code:
(use-package tide
  :diminish
  :hook (typescript-mode . setup-tide-mode)
  :general
  (general-define-key
   :states '(normal visual insert emacs)
   :prefix "SPC m"
   :non-normal-prefix "C-SPC m"
   :keymaps 'typescript-mode-map
   "" '(nil :which-key "Typescript")
   "e"  '(:ignore t :which-key "Error")
   "el" '(tide-project-errors :which-key "list")
   "en" '(tide-next-error-function :which-key "next")
   "ep" '(tide-find-previous-error :which-key "previous")
   "g" '(tide-jump-to-definition :which-key "jump to definition")
   "r" '(tide-rename-symbol :which-key "rename var")
   "s" '(tide-restart-server :which-key "restart server")
   )
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (flycheck-mode +1)
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1)
    (npm-mode +1)
    (if (locate-dominating-file default-directory ".prettierrc")
        (prettier-js-mode +1)
      (add-hook 'before-save-hook 'tide-format-before-save))
    (company-mode +1))
  (setq company-tooltip-align-annotations t))

(provide 'typescript-layer)
;;; typescript-layer.el ends here
