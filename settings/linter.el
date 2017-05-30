(use-package flycheck
  :diminish flycheck-mode
  :init
  (add-hook 'after-init-hook 'global-flycheck-mode))
