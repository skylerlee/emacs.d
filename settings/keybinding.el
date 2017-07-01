(use-package evil
  :init
  (add-hook 'after-init-hook 'evil-mode))

(use-package general)

(use-package which-key
  :init
  (add-hook 'after-init-hook 'which-key-mode))
