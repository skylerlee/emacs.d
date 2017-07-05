(use-package ivy
  :diminish ivy-mode
  :general
  (:keymaps 'ivy-minibuffer-map
            "<escape>" 'minibuffer-keyboard-quit
            "<right>" 'ivy-alt-done)
  :init
  (setq ivy-re-builders-alist
        '((counsel-M-x . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))
  (add-hook 'after-init-hook 'ivy-mode))

(use-package smex
  :init
  (setq smex-history-length 16
        smex-save-file (concat varan-cache-directory ".smex-items")))

(use-package counsel
  :diminish counsel-mode
  :general
  ("M-x" 'counsel-M-x)
  :init
  (add-hook 'after-init-hook 'counsel-mode))

(use-package swiper
  :general
  ("C-s" 'swiper))
