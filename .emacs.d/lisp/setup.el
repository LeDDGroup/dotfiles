(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq
 use-package-always-ensure t
 use-package-compute-statistics t)

(defun add-layer (layer)
  (load (concat layer "/packages") 'noerror)
  (load (concat layer "/funcs") 'noeror)
  (load (concat layer "/config") 'noerror)
  (load (concat layer "/keybindings") 'noerror))

(defun use-layers (layers)
  (dolist (layer layers)
    (add-layer (symbol-name layer))))
