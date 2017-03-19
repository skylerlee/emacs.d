;;; varan-common.el -- emacs common utilities
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(defmacro varan|define-directory (name &optional docstring)
  "Define a variable named `varan-NAME-directory'.
The value is the path of subdirectory in `user-emacs-directory' with the
corresponding name."
  `(defvar ,(intern (format "varan-%s-directory" name))
     ,(file-name-as-directory (concat user-emacs-directory name))
     ,docstring))

(provide 'varan-common)
