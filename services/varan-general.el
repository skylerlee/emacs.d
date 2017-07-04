;;; varan-general.el -- emacs general keybinding service
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'general)
(require 'use-package)

(defmacro varan-general//bind-keys (_ package &rest args)
  '(ignore))

;; Extend use-package with `:general' keyword
(add-to-list 'use-package-keywords :general t)

(defun use-package-normalize/:general (name keyword args)
  (use-package-normalize-binder name keyword args))

(defun use-package-handler/:general (name keyword arg rest state)
  (use-package-handler/:bind name keyword arg rest state
                             'varan-general//bind-keys))

(provide 'varan-general)
