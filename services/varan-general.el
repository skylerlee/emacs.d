;;; varan-general.el -- emacs general keybinding service
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'general)
(require 'use-package)

(defun varan-general//normalize-args (label args)
  (let (result block head prev)
    (while args
      (setq head (pop args)
            prev (caar block))
      (when (and (keywordp head) (not (keywordp prev)))
        (push (nreverse block) result)
        (setq block nil))
      (cond
       ((keywordp head) (push (cons head (pop args)) block))
       ((consp head) (push head block))
       (t (varan/error "%s invalid argument: %s" label head))))
    (push (nreverse block) result)
    (nreverse result)))

;; Extend use-package with `:bind-general' keyword
(add-to-list 'use-package-keywords :bind-general t)

(defun use-package-normalize/:bind-general (name keyword args)
  (use-package-as-one (symbol-name keyword) args
    'varan-general//normalize-args))

(defun use-package-handler/:bind-general (name keyword arg rest state)
  (use-package-handler/:bind name keyword arg rest state
                             'varan-general//bind-keys))

(provide 'varan-general)
