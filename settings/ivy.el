(use-package ivy
  :config
  (ivy-mode 1))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x))

(use-package smex
  :bind
  ("M-X" . smex-major-mode-commands))
