(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(load "setup")
(load "init-benchmark")
(load "core")

(basic-layer)

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
