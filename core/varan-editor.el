;;; varan-editor.el -- emacs editor configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Tweak editor preference
(prefer-coding-system 'utf-8-unix)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; Tweak editor appearance
(setq-default cursor-type 'bar)
(add-hook 'prog-mode-hook 'hl-line-mode)
(add-hook 'text-mode-hook 'hl-line-mode)

;; Tweak editing behavior
(defalias 'yes-or-no-p 'y-or-n-p)

(let ((backup-dir
       (file-name-as-directory (concat varan-cache-directory "backups"))))
  (setq auto-save-list-file-prefix (concat backup-dir ".saves-")
        auto-save-file-name-transforms `((".*" ,backup-dir t))
        backup-directory-alist `((".*" . ,backup-dir))))

(provide 'varan-editor)
