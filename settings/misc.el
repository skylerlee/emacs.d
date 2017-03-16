(use-package nlinum
  :init
  (progn
    (setq nlinum-format "%4d")
    (add-hook 'prog-mode-hook 'nlinum-mode)
    (add-hook 'text-mode-hook 'nlinum-mode)))

(use-package nyan-mode
  :init
  (progn
    (add-hook 'prog-mode-hook 'nyan-mode)
    (add-hook 'text-mode-hook 'nyan-mode)))
