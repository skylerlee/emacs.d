(use-package nlinum
  :init
  (setq nlinum-format "%4d")
  (add-hook 'prog-mode-hook 'nlinum-mode)
  (add-hook 'text-mode-hook 'nlinum-mode))

(use-package nyan-mode
  :init
  (add-hook 'prog-mode-hook 'nyan-mode)
  (add-hook 'text-mode-hook 'nyan-mode))

(use-package fill-column-indicator
  :init
  (add-hook 'prog-mode-hook 'fci-mode))
