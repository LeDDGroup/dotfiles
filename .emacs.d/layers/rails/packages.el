(use-package projectile-rails
  :config
  (message "projectile-rails")
  (projectile-rails-global-mode)
  (my-local-leader-def
    :keymaps 'projectile-rails-mode-map
    "m" 'projectile-rails-find-model
    "c" 'projectile-rails-find-controller
    "v" 'projectile-rails-find-view
    "g" 'projectile-rails-mode-goto-map))
