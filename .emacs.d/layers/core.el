;;; package --- Sumary
;;; Commentary:
;;; core.el
;;; Code:
(defun open-scratch-buffer ()
  "Open scratch buffer."
  (interactive)
  (switch-to-buffer "scratch"))

(defun kill-current-buffer ()
  "Kill current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

(defun reload-config ()
  "Reload .emacs"
  (interactive)
  (load-file user-init-file))

(defun edit-config ()
  "Open 'user-init-file'."
  (interactive)
  (find-file user-init-file))

(provide 'core)
;;; core.el ends here
