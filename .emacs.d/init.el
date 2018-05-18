(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "layers" user-emacs-directory))

(load "setup")
(load "init-benchmark")
(load "core")

(use-layers '(basic))

(require 'others)

(load custom-file 'noerror)
