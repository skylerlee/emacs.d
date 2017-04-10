(use-package ivy
  :init
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
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
