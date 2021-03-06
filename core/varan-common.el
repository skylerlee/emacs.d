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
        (path (varan/subdirectory name))
        (kwargs (varan/parse-keywords args)))
    (when (alist-get :hidden kwargs)
      (setq path (varan/subdirectory (concat "." name))))
    (when (alist-get :ensure kwargs)
      (unless (file-exists-p path) (make-directory path)))
    `(defvar ,dir ,path ,docstring)))

(defun varan/parse-keywords (kwlist)
  (let (key val result)
    (while kwlist
      (setq key (pop kwlist)
            val (pop kwlist))
      (unless (keywordp key)
        (varan/error "Keyword argument expected"))
      (when (keywordp val)
        (varan/error "Value argument expected"))
      (push (cons key val) result))
    (reverse result)))

(defsubst varan/error (msg &rest args)
  (error (concat "varan: " (apply #'format msg args))))

(defun varan//assure-list (element)
  (if (listp element) element
    (list element)))

(defun varan/autoload (function-or-list
                       file
                       &optional docstring interactive type)
  "Define an autoload function that is contained in FILE.
FUNCTION-OR-LIST is either a symbol or a list of symbols of the
autoload function; FILE is the file name to pass to `load'."
  (mapc (lambda (func)
          (autoload func file docstring interactive type))
        (varan//assure-list function-or-list)))

(defun varan/load-code (file-or-list)
  "Load Lisp code relative to the file that is currently loaded.
FILE-OR-LIST is either a symbol or a list of symbols with the
same name as the Lisp file to load."
  (mapc (lambda (file)
          (load (concat (file-name-directory load-file-name)
                        (symbol-name file))))
        (varan//assure-list file-or-list)))

(provide 'varan-common)
