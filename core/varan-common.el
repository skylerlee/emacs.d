;;; varan-common.el -- emacs common utilities
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(defun varan/subdirectory (name)
  "Path of the NAME subdirectory in `user-emacs-directory'."
  (file-name-as-directory (concat user-emacs-directory name)))

(defmacro varan|define-directory (name &optional docstring &rest args)
  "Define a variable named `varan-NAME-directory'.
The value is the path of subdirectory in `user-emacs-directory' with the
corresponding name."
  (unless (string-or-null-p docstring)
    (push docstring args)
    (setq docstring nil))
  (let ((dir (intern (format "varan-%s-directory" name)))
        (path (varan/subdirectory name)))
    (varan//defdir-process-keywords path args)
    `(defvar ,dir ,path ,docstring)))

(defsubst varan/error (msg &rest args)
  (error (concat "varan: " (apply #'format msg args))))

(defun varan//defdir-process-keywords (path kwlist)
  (let (key val keyname subfunc)
    (while kwlist
      (setq key (pop kwlist)
            val (pop kwlist))
      (unless (keywordp key)
        (varan/error "Keyword argument expected"))
      (setq keyname (symbol-name key)
            subfunc (intern (format "varan//defdir-subfunc/%s" keyname)))
      (unless (functionp subfunc)
        (varan/error "Unknown keyword: %s" keyname))
      (funcall subfunc path val))))

(defun varan//defdir-subfunc/:ensure (path val)
  (when val
    (unless (file-exists-p path)
      (make-directory path))))

(provide 'varan-common)
