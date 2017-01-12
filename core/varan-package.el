;;; varan-package.el -- emacs core package configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Add package archives
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(provide 'varan-package)
