(use-package magit)

(use-package diff-hl
  :init
  (add-hook 'after-init-hook 'global-diff-hl-mode)
  (add-hook 'after-init-hook 'diff-hl-flydiff-mode)
  (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package undo-tree)
