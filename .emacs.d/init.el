(package-initialize)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(require 'setup)
(require 'init-benchmark)
(require 'core)
(require 'basic)
(require 'others)
(require 'neotree-layer)
(require 'align)

(add-to-list 'load-path (expand-file-name "layers" user-emacs-directory))

(require 'utils)
(require 'typescript-layer)
(require 'git-layer)
(require 'web-layer)
(require 'rails-layer)
