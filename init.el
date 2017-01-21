;;; emacs config
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Prevent package auto initialization
;; (package-initialize)

;; Const definitions
(defconst varan-minreq-version "24.0" "Minimal emacs version required.")

;; Check version compatibility
(when (version< emacs-version varan-minreq-version)
  (error (concat "Require emacs version %s or above. "
                 "Your version is %s.")
         varan-minreq-version emacs-version))

;; Define root directory
(defvar varan-root-directory
  (file-name-directory load-file-name))

;; Define top level directories
(defvar varan-core-directory
  (expand-file-name (concat varan-root-directory "core/")))

(defvar varan-templates-directory
  (expand-file-name (concat varan-root-directory "templates/")))

(defvar varan-user-directory
  (expand-file-name (concat varan-root-directory "user/")))

;; Load core module
(add-to-list 'load-path varan-core-directory)
(require 'varan-core)

;; Load user custom file
(load custom-file)
