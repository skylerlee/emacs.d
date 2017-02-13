(use-package ivy
  :config
  (ivy-mode 1))

(use-package smex
  :init
  (setq smex-history-length 16
        smex-save-file (concat varan-cache-directory ".smex-items")))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  :config
  (counsel-mode 1))

(use-package swiper
  :bind
  ("C-s" . swiper))
