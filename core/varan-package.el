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

;; Load package modules
(let ((modules '("services" "settings"))
      (load-module (lambda (name)
                     (load (concat (varan/subdirectory name) "index")))))
  (mapc load-module modules))

(provide 'varan-package)
