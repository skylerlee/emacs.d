;;; varan-package.el -- emacs package management
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Initialize package manager
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; Check requirements
(unless (package-installed-p 'use-package)
  (error "Missing required package: use-package. Please install."))

;; Load setting files
(mapc (lambda (name)
        (load (file-name-sans-extension name)))
      (directory-files varan-settings-directory t "\\.el\\'"))

(provide 'varan-package)
