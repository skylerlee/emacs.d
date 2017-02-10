(use-package diff-hl
  :init
  (global-diff-hl-mode)
  :config
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode))
