(use-package general
  :config
  (general-create-definer my-leader-def
    :states '(normal visual insert emacs)
    :prefix "SPC"
    :non-normal-prefix "C-SPC")
  (mapc (lambda (i)
          (fset (intern (concat "goToBuffer" (number-to-string i)))
                (eval `(lambda ()
                  (interactive)
                  (goToBuffer (- ,i 1))))))
        (number-sequence 1 9))
  (evil-define-key 'normal 'with-editor-mode-map
    ",," 'with-editor-finish
    ",k" 'with-editor-cancel)
  (general-define-key
   "C-S-t" 'open-scratch-buffer)
  (general-define-key
   :keymaps 'projectile-command-map
   "t" 'neotree-projectile-action)
  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "C-h" 'ivy-backward-kill-word
   "C-j" 'ivy-next-line
   "C-k" 'ivy-previous-line)

  (general-define-key
   :states '(visual)
   ",," 'comment-region)
  (my-leader-def
   ":" 'evil-ex
   ";" '(comment-line :which-key "Comment line/lines")
   "SPC" `(execute-extended-command :which-key "Run command")

   "1" 'goToBuffer1
   "2" 'goToBuffer2
   "3" 'goToBuffer3
   "4" 'goToBuffer4
   "5" 'goToBuffer5
   "6" 'goToBuffer6
   "7" 'goToBuffer7
   "8" 'goToBuffer8
   "9" 'goToBuffer9

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
   "fe"  '(:ignore t :which-key "Emacs")
   "fed" '(edit-config :which-key "Config File")
   "fer" '(reload-config :which-key "Reload config File")
   "ff" '(find-file :which-key "Find file")
   "fp" '(neotree-projectile-action :which-key "Neotree project")
   "fr" '(ivy-recentf :which-key "Recent file")
   "fs" '(save-buffer :which-key "Save file")
   "ft" '(neotree-toggle :which-key "Toggle neotree")

   ;; Git

   "g"  '(:ignore t :which-key "Git")
   "gS" '(magit-stage-file :which-key "git stage")
   "gU" '(magit-unstage-file :which-key "git unstage")
   "gb" '(magit-blame :which-key "git blame")
   "gc"  '(:ignore t :which-key "In Code")
   "gcn" '(diff-hl-next-hunk :which-key "next hunk")
   "gcp" '(diff-hl-previous-hunk :which-key "previous hunk")
   "gcr" '(diff-hl-revert-hunk :which-key "revert hunk")
   "gs" '(magit-status :which-key "git status")
   "gt" '(git-timemachine :which-key "git time machine")

   ;; Help

   "h" '(:ignore t :which-key "Help")
   "hK" 'Info-goto-emacs-key-command-node
   "hd" '(:ignore t :which-key "Describe")
   "hdf" 'describe-function
   "hdk" 'describe-key
   "hdm" 'describe-mode
   "hdp" 'describe-package
   "hdv" 'describe-variable
   "hw" 'where-is

   "l"  '(:ignore t :which-key "Line")
   "ls" '(sort-lines :which-key "Sort lines")
   "p" 'projectile-command-map
   "q"  '(:ignore t :which-key "Quit")
   "qq" '(kill-emacs :which-key "Kill emacs")

   ;; REPL / Refactor

   "r"  '(:ignore t :which-key "REPL / Refactor")
   "rp" '(prettier-js :which-key "Prettierjs")
   "ri" 'ielm

   "s"  '(:ignore t :which-key "Search")
   "ss" '(swiper :which-key "swiper")

   ;; Toggle

   "t"  '(:ignore t :which-key "Toggle")
   "tt"  'load-theme
   "tm"  '(:ignore t :which-key "Mode")
   "tmc" '(company-mode :which-key "Company")
   "tmf" '(flycheck-mode :which-key "Flycheck")
   "tmp" '(prettier-js-mode :which-key "Prettier js")
   "tr" '(tide-rename-symbol :which-key "rename")

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
   "ws" '(evil-window-split :which-key "Horizontal split")
   "wv" '(evil-window-vsplit :which-key "Vertical split")
   "ww" '(evil-window-next :which-key "Next Window")
   ))

(provide 'init-general)
