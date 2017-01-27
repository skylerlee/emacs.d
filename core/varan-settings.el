;;; varan-settings.el -- emacs setting files configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Check requirements
(unless (package-installed-p 'use-package)
  (error "Missing required package: use-package. Please install."))

;; Load setting files
(mapc (lambda (name)
        (load (file-name-sans-extension name)))
      (directory-files varan-settings-directory t "\\.el"))

(provide 'varan-settings)
