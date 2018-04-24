(defun open-scratch-buffer ()
  (interactive)
  (switch-to-buffer "scratch"))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun reload-config ()
  "Reload .emacs"
  (interactive)
  (load-file user-init-file))

(defun edit-config ()
  "Edit .emacs"
  (interactive)
  (find-file user-init-file))
