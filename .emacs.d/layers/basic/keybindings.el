(evil-define-key 'normal 'with-editor-mode-map
  ",," 'with-editor-finish
  ",k" 'with-editor-cancel)

(my-leader-def
  "+" 'text-scale-increase
  "-" 'text-scale-decrease
  ":" 'counsel-M-x
  ";" '(comment-line :which-key "Comment line/lines")
  "SPC" `(execute-extended-command :which-key "Run command")

  ;; Applications
  "a"  '(:ignore t :which-key "Applications")
  "ac" '(calc :which-key "Calc")
  "ad" '(dired :which-key "Dired")

  ;; Buffer
  "b"  '(:ignore t :which-key "Buffer")
  "bb" 'ivy-switch-buffer
  "bd" '(kill-current-buffer :which-key "Kill buffer")
  "bn" '(next-buffer :which-key "Next buffer")
  "bp" '(previous-buffer :which-key "Previous buffer")
  "bs" '(open-scratch-buffer :which-key "Scratch buffer")

  ;; Eval / Error
  "e"  '(:ignore t :which-key "Eval / Error")
  "eb" '(eval-buffer :which-key "Eval buffer")
  "el" '(flycheck-list-errors :which-key "List errors")
  "en" '(next-error :which-key "Next error")
  "ep" '(previous-error :which-key "Previous error")
  "eN" '(previous-error :which-key "Previous error")
  "eP" '(next-error :which-key "Next error")

  ;; File
  "f"  '(:ignore t :which-key "File")
  "fD" '(delete-current-file :which-key "Delete Current File")
  "fe"  '(:ignore t :which-key "Emacs")
  "fed" '(edit-config :which-key "Config File")
  "fer" '(reload-config :which-key "Reload config File")
  "ff" '(find-file :which-key "Find file")
  "fp" '(neotree-projectile-action :which-key "Neotree project")
  "fr" '(ivy-recentf :which-key "Recent file")
  "fs" '(save-buffer :which-key "Save file")
  "ft" '(neotree-toggle :which-key "Toggle neotree")

  ;; Help
  "h"   '(:ignore t :which-key "Help")
  "hK"  'Info-goto-emacs-key-command-node
  "hd"  '(:ignore t :which-key "Describe")
  "hdf" 'describe-function
  "hdk" 'describe-key
  "hdm" 'describe-mode
  "hdp" 'describe-package
  "hdv" 'describe-variable
  "hw"  'where-is

  ;; Others
  "l"  '(:ignore t :which-key "Line")
  "ls" '(sort-lines :which-key "Sort lines")
  "p"  'projectile-command-map
  "q"  '(:ignore t :which-key "Quit")
  "qq" '(kill-emacs :which-key "Kill emacs")

  ;; REPL / Refactor
  "r"  '(:ignore t :which-key "REPL / Refactor")
  "rp" '(prettier-js :which-key "Prettierjs")
  "ri" 'ielm

  ;; Search
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

  ;; Align
  "a," 'align-to-comma-before
  "a=" 'align-to-equals
  "a(" 'align-to-paren-open
  "a)" 'align-to-paren-close
  "a:" 'align-to-colon

  ;; Window
  "w"  '(:ignore t :which-key "Window")
  "wH" '(evil-window-move-far-left :which-key "Move left")
  "wJ" '(evil-window-move-very-bottom :which-key "Move up")
  "wK" '(evil-window-move-very-top :which-key "Move down")
  "wL" '(evil-window-move-far-right :which-key "Move right")
  "wd" '(evil-window-delete :which-key "Delete")
  "wh" '(evil-window-left :which-key "Left")
  "wj" '(evil-window-down :which-key "Down")
  "wk" '(evil-window-up :which-key "Up")
  "wl" '(evil-window-right :which-key "Right")
  "wm" '(delete-other-windows :which-key "Delete other windows")
  "ws" '(evil-window-split :which-key "Horizontal split")
  "wv" '(evil-window-vsplit :which-key "Vertical split")
  "ww" '(evil-window-next :which-key "Next Window"))
