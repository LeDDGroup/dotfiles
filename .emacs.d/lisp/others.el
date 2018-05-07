(use-package add-node-modules-path)

(use-package exec-path-from-shell
  :hook shell-mode
  :config
  (exec-path-from-shell-initialize))

(use-package restclient
  :commands (restclient-mode))

(setq auto-mode-alist (append '(("\\.http$" . restclient-mode)) auto-mode-alist))

(use-package command-log-mode
  :commands (clm/open-command-log-buffer)
  :config
  (command-log-mode))

(use-package prettier-js

  :hook (web-mode-hook . prettier-js-mode)
  :config
  (setq prettier-js-show-errors 'echo)
  (setq prettier-js-args '(
                           "--config-precedence" "prefer-file"
                           "--print-width" "100"
                           "--trailing-comma" "all"
                           )))

(use-package tabbar
  :commands tabbar-mode
  :after (general)
  :config
  (setq buffers-index ())
  (defun tabbar-kill-current-buffer ()
    (interactive)
    (setq buffers-index (delete (buffer-name) buffers-index))
    (kill-current-buffer))
  (defun goToBuffer (bufferIndex)
    (interactive)
    (switch-to-buffer (nth bufferIndex (reverse buffers-index))))
  (defun prune (bufferIndex)
    (interactive)
    (switch-to-buffer (nth bufferIndex (reverse buffers-index))))
  (defun my-tabbar-buffer-groups ()
    ;; (setq-local buffers-index ())
    (list (cond ((string-equal "*" (substring (buffer-name) 0 1)) "emacs")
                ((eq major-mode 'dired-mode) "emacs")
                ((string-equal "magit" (substring (buffer-name) 0 5)) "magit")
                (t (progn
                     ;; (print (buffer-name) t)
                     (add-to-list 'buffers-index (buffer-name))
                     "user")))))

  (setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
  (my-leader-def
    "tmt" '(tabbar-mode :which-key "Tabbar")
    "<tab>"  '(:ignore t :which-key "Tabbar")
    "<tab>n" '(tabbar-forward-group :which-key "Tabbar forward group")
    "<tab>p" '(tabbar-backward-group :which-key "Tabbar backward group"))
  (general-define-key
   "C-q" 'tabbar-kill-current-buffer
   "C-<tab>" 'tabbar-forward-tab
   "<C-S-iso-lefttab>" 'tabbar-backward-tab))

(provide 'others)
