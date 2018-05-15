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
 "t" '(fix-errors-with-tslint :which-key "fix errors with tslint"))
