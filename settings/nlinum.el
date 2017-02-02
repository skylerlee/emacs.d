(use-package nlinum
  :init
  (setq nlinum-format "%4d")
  :config
  (progn
    (add-hook 'prog-mode-hook 'nlinum-mode)
    (add-hook 'text-mode-hook 'nlinum-mode)))
