;;; varan-general.el -- emacs general keybinding service
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'general)
(require 'use-package)

(add-to-list 'use-package-keywords :bind-general t)

(defun use-package-normalize/:bind-general (name keyword args)
  (use-package-as-one (symbol-name keyword) args
    (lambda (label arg)
      (unless (consp arg)
        (use-package-error (concat label " wants a list of (key . def)")))
      arg)))

(defun use-package-handler/:bind-general (name keyword arg rest state)
  (use-package-handler/:bind name keyword arg rest state
                             'varan-general//bind-keys))

(provide 'varan-general)
