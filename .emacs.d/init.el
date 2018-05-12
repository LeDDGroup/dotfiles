(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(load "setup")
(load "init-benchmark")
(load "core")

(defun add-layer (layer)
  (load (concat "layers/" layer "/packages") 'noerror)
  (load (concat "layers/" layer "/funcs") 'noeror)
  (load (concat "layers/" layer "/config") 'noerror)
  (load (concat "layers/" layer "/keybindings") 'noerror))

(defun use-layers (layers)
  (dolist (layer layers)
    (add-layer (symbol-name layer))))

(use-layers '(basic))

(require 'sort-utils)
(require 'basic)
(require 'others)
(require 'align-customs)

;; (add-to-list 'load-path (expand-file-name "layers" user-emacs-directory))

;; (require 'utils)
;; (require 'typescript-layer)
;; (require 'git-layer)
;; (require 'web-layer)
;; (require 'rails-layer)
