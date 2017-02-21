(use-package company
  :init
  (progn
    (setq company-idle-delay 0.2
          company-minimum-prefix-length 2)
    (add-hook 'after-init-hook 'global-company-mode)))
