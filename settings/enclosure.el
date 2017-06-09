(use-package smartparens
  :init
  (add-hook 'prog-mode-hook 'smartparens-mode)
  :config
  (require 'smartparens-config)
  (show-smartparens-global-mode))

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode))
