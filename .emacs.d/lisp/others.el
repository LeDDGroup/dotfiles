(use-package add-node-modules-path)

(use-package exec-path-from-shell
  :hook shell-mode
  :config
  (exec-path-from-shell-initialize))

(use-package restclient
  :commands (restclient-mode))

(use-package npm-mode
  :commands (npm-mode))

(use-package command-log-mode
  :commands (clm/open-command-log-buffer)
  :config
  (command-log-mode))

(provide 'others)
