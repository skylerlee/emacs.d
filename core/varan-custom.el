;;; varan-custom.el -- emacs custom file configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Define custom file location
(setq custom-file
      (expand-file-name (concat varan-user-directory "custom.el")))
(unless (file-exists-p custom-file)
  (copy-file
   (expand-file-name (concat varan-templates-directory "custom.el"))
   custom-file))

(provide 'varan-custom)
