;;; package --- Sumary
;;; Commentary:
;;; core.el
;;; Code:

(defun kill-current-buffer ()
  "Kill current buffer."
  (interactive)
  (kill-buffer (current-buffer)))

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
