(defun open-scratch-buffer ()
  (interactive)
  (switch-to-buffer "scratch"))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))

(defun edit-config ()
  "Edit .emacs"
  (interactive)
  (find-file user-init-file))
