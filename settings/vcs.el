(use-package magit)

(use-package diff-hl
  :init
  (progn
    (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
    (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
    (global-diff-hl-mode)))
