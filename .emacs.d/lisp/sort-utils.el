(defun sort-by-value (begin end)
  "Sort region by value
eg:
const a = 5;
const b = 4;

const b = 4;
const a = 5;
"
  (interactive "r")
  (sort-regexp-fields nil "^.*$" "=.*;$" begin end))

(defun sort-by-first-string (begin end)
  "Sort region by first string wrapped in \"\""
  (interactive "r")
  (sort-regexp-fields nil "^.*$" "\".*\"" begin end))

(provide 'sort-utils)
