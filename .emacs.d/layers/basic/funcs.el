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

;; Align
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

(defun align-to-paren-open (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) "(") 1 1 ))

(defun align-to-paren-close (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end
                (rx (group (zero-or-more (syntax whitespace))) ")") 1 1 ))

;; Sort
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

(defun sort-by-first-string-single (begin end)
  "Sort region by first string wrapped in \"\""
  (interactive "r")
  (sort-regexp-fields nil "^.*$" "'.*'" begin end))

(defun sort-by-first-string (begin end)
  "Sort region by first string wrapped in \"\""
  (interactive "r")
  (sort-regexp-fields nil "^.*$" "\".*\"" begin end))

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

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(defun my-dired-create-file (file)
  "Create a file called FILE.
If FILE already exists, signal an error."
  (interactive
   (list (read-file-name "Create file: " (dired-current-directory))))
  (let* ((expanded (expand-file-name file))
         (try expanded)
         (dir (directory-file-name (file-name-directory expanded)))
         new)
    (if (file-exists-p expanded)
        (error "Cannot create file %s: file exists" expanded))
    ;; Find the topmost nonexistent parent dir (variable `new')
    (while (and try (not (file-exists-p try)) (not (equal new try)))
      (setq new try
            try (directory-file-name (file-name-directory try))))
    (when (not (file-exists-p dir))
      (make-directory dir t))
    (write-region "" nil expanded t)
    (when new
      (dired-add-file new)
      (dired-move-to-filename))))
