;;; varan-editor.el -- emacs editor configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Tweak editor preference
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Tweak editor appearance
(setq-default cursor-type 'bar)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'text-mode-hook 'hl-line-mode)

;; Tweak editing behavior
(setq backup-directory-alist
      `((".*" . ,varan-cache-directory))
      auto-save-file-name-transforms
      `((".*" ,varan-cache-directory t)))

(defalias 'yes-or-no-p 'y-or-n-p)

(provide 'varan-editor)
