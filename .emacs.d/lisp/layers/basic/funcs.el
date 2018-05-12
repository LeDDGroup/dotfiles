(defun open-scratch-buffer ()
  "Open scratch buffer."
  (interactive)
  (switch-to-buffer "*scratch*"))

(defun reload-config ()
  "Reload 'user-init-file'"
  (interactive)
  (load-file user-init-file))

(defun edit-config ()
  "Open 'user-init-file'"
  (interactive)
  (find-file user-init-file))
