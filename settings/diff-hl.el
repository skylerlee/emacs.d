(use-package diff-hl
  :init
  (progn
    (add-hook 'dired-mode-hook 'diff-hl-dired-mode)
    (global-diff-hl-mode)))
