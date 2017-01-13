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

;; Load core module
(defvar varan-core-directory
  (expand-file-name (concat (file-name-directory load-file-name)
                            "core/")))
(add-to-list 'load-path varan-core-directory)
(require 'varan-core)
