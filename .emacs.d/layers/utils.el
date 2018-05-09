;;; package --- Sumary
;;; Commentary:
;;; core.el
;;; Code:
(defun open-scratch-buffer ()
  "Open scratch buffer."
  (interactive)
  (switch-to-buffer "*scratch*"))

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

(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun delete-current-file ()
  "Delete current file"
  (interactive)
  (delete-file (buffer-file-name))
  (kill-current-buffer))

(provide 'utils)
;;; core.el ends here
