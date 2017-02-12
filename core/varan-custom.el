;;; varan-custom.el -- emacs custom file configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Define custom themes location
(add-to-list 'custom-theme-load-path varan-themes-directory)
(add-to-list 'load-path varan-themes-directory)
(setq custom-theme-directory varan-user-directory)

;; Define custom file location
(setq custom-file
      (expand-file-name (concat varan-user-directory "custom.el")))
(unless (file-exists-p custom-file)
  (copy-file
   (expand-file-name (concat varan-templates-directory "custom.el"))
   custom-file))

(provide 'varan-custom)
