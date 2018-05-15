(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "layers" user-emacs-directory))

(load "setup")
(load "init-benchmark")
(load "core")

(defun add-layer (layer)
  (load (concat layer "/packages") 'noerror)
  (load (concat layer "/funcs") 'noeror)
  (load (concat layer "/config") 'noerror)
  (load (concat layer "/keybindings") 'noerror))

(defun use-layers (layers)
  (dolist (layer layers)
    (add-layer (symbol-name layer))))

(use-layers '(basic
              typescript
              git
              rails))

(require 'others)

(require 'utils)
(require 'web-layer)
