;;; varan-bootstrap.el -- emacs configuration bootstrap
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Define root directory
(defvar varan-root-directory
  (expand-file-name user-emacs-directory))

;; Define top level directories
(defvar varan-core-directory
  (expand-file-name (concat varan-root-directory "core/")))

(defvar varan-settings-directory
  (expand-file-name (concat varan-root-directory "settings/")))

(defvar varan-templates-directory
  (expand-file-name (concat varan-root-directory "templates/")))

(defvar varan-user-directory
  (expand-file-name (concat varan-root-directory "user/")))