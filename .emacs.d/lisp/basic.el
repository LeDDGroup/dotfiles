(use-package diminish)

(use-package undo-tree
  :diminish)

(use-package projectile
  :diminish
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode))

(use-package flycheck
  :diminish
  :hook (prog-mode . flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc)))

(use-package company
  :diminish
  :hook (prog-mode . company-mode))

(use-package flx)

(use-package ivy
  :diminish
  :config
  (setq ivy-use-selectable-prompt t)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t))

(use-package counsel
  :diminish)

(use-package counsel-projectile)

(use-package nlinum
  :config
  (global-nlinum-mode 1))

(use-package which-key
  :config
  (which-key-mode))

(use-package evil
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (defun evil-backward ()
    (interactive)
    (evil-delete-backward-char 1 1)
    (evil-delete-backward-word))
  (evil-mode 1))

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
   ":" 'counsel-M-x
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

   "h"   '(:ignore t :which-key "Help")
   "hK"  'Info-goto-emacs-key-command-node
   "hd"  '(:ignore t :which-key "Describe")
   "hdf" 'describe-function
   "hdk" 'describe-key
   "hdm" 'describe-mode
   "hdp" 'describe-package
   "hdv" 'describe-variable
   "hw"  'where-is

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
   "tmc" '(company-mode :which-key "Company")
   "tmf" '(flycheck-mode :which-key "Flycheck")
   "tmp" '(prettier-js-mode :which-key "Prettier js")
   "tr"  '(tide-rename-symbol :which-key "rename")

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

(use-package evil-commentary
  :after (general)
  :commands (evil-commentary)
  :config
  (my-leader-def
    ";" 'evil-commentary))

(use-package evil-escape
  :config
  (setq-default evil-escape-key-sequence "fd")
  (setq-default evil-escape-delay 0.1)
  (evil-escape-mode))

(use-package golden-ratio
  :after (evil)
  :diminish
  :config
  (setq golden-ratio-extra-commands
	(append golden-ratio-extra-commands
		'(evil-window-left
		  evil-window-right
		  evil-window-up
		  evil-window-down)))
  (golden-ratio-mode 1))

(use-package all-the-icons
  :commands (neotree-toggle))

(use-package neotree
  :commands (neotree-projectile-action neotree-toggle)
  :config
  (setq neo-window-fixed-size nil)
  (setq neo-smart-open nil)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (evil-define-key 'normal neotree-mode-map (kbd "'") 'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "-") 'neotree-enter-horizontal-split)
  (evil-define-key 'normal neotree-mode-map (kbd "C") 'neotree-copy-node)
  (evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-select-previous-sibling-node)
  (evil-define-key 'normal neotree-mode-map (kbd "J") 'neotree-select-down-node)
  (evil-define-key 'normal neotree-mode-map (kbd "K") 'neotree-select-up-node)
  (evil-define-key 'normal neotree-mode-map (kbd "L") 'neotree-select-next-sibling-node)
  (evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-change-root)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "c") 'neotree-create-node)
  (evil-define-key 'normal neotree-mode-map (kbd "d") 'neotree-delete-node)
  (evil-define-key 'normal neotree-mode-map (kbd "gr") 'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "h") 'spacemacs/neotree-collapse-or-up)
  (evil-define-key 'normal neotree-mode-map (kbd "j") 'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "k") 'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "l") 'spacemacs/neotree-expand-or-open)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-rename-node)
  (evil-define-key 'normal neotree-mode-map (kbd "s") 'neotree-hidden-file-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "y") 'neotree-copy-filepath-to-yank-ring)
  (evil-define-key 'normal neotree-mode-map (kbd "|") 'neotree-enter-vertical-split))

(provide 'basic)
