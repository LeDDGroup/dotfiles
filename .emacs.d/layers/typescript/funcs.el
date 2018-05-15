(defun fix-errors-with-tslint ()
  "Fix errors in current file with tslint and revert buffer"
  (interactive)
  (shell-command-to-string (format "tslint --fix %s" buffer-file-name))
  (revert-buffer-no-confirm))
