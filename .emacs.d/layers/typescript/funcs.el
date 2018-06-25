(defun format-with-prettier ()
  "Format file with prettier"
  (interactive)
  (shell-command-to-string (format "prettier --config-precedence prefer-file --print-width 100 --trailing-comma all --write %s" buffer-file-name))
  (revert-buffer-no-confirm))

(defun fix-errors-with-tslint ()
  "Fix errors in current file with tslint and revert buffer"
  (interactive)
  (shell-command-to-string (format "tslint --fix %s" buffer-file-name))
  (revert-buffer-no-confirm))
