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

;; Load core module
(defvar varan-core-directory
  (expand-file-name (concat varan-root-directory "core/")))
(add-to-list 'load-path varan-core-directory)

(require 'varan-core)
