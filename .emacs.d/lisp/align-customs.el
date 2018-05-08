(defun align-to-colon (begin end)
  "Align region to colon (:) signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) ":") 1 1 ))

(defun align-to-comma (begin end)
  "Align region to comma signs"
  (interactive "r")
  (align-regexp begin end
                (rx "," (group (zero-or-more (syntax whitespace))) ) 1 1 ))


(defun align-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "=") 1 1 ))

(defun align-to-comma-before (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) ",") 1 1 ))

(my-leader-def
  "a," 'align-to-comma-before
  "a=" 'align-to-equals
  "a:" 'align-to-colon)

(provide 'align-customs)
