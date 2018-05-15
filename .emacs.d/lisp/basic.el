(my-leader-def
  "l"  '(:ignore t :which-key "Line")
  "ls" '(sort-lines :which-key "Sort lines")
  "p"  'projectile-command-map
  "q"  '(:ignore t :which-key "Quit")
  "qq" '(kill-emacs :which-key "Kill emacs")

  ;; REPL / Refactor

  "r"  '(:ignore t :which-key "REPL / Refactor")
  "rp" '(prettier-js :which-key "Prettierjs")
  "ri" 'ielm

  "s"  '(:ignore t :which-key "Search")
  "ss" '(swiper :which-key "swiper")

  ;; Toggle

  "t"   '(:ignore t :which-key "Toggle")
  "tt"  'load-theme
  "tu"  'undo-tree-visualize
  "tm"  '(:ignore t :which-key "Mode")
  "tn"  'neotree-toggle
  "te"  'eshell
  "ts"  'shell
  "tmc" '(company-mode :which-key "Company")
  "tmf" '(flycheck-mode :which-key "Flycheck")
  "tmp" '(prettier-js-mode :which-key "Prettier js")
  "tr"  '(tide-rename-symbol :which-key "rename")

  ;; Text

  "x"   '(:ignore t :which-key "Text")
  "xs"   '(:ignore t :which-key "Sort")
  "xs\""  '(sort-by-first-string :which-key "first string")
  "xsv"  '(sort-by-value :which-key "value")
  "xsl" '(sort-lines :which-key "sort lines")

  )

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
