;;; emacs config
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Const definitions

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defconst varan-minreq-version "24.0" "Minimal emacs version required.")

;; Check version compatibility
(when (version< emacs-version varan-minreq-version)
  (error (concat "Require emacs version %s or above. "
                 "Your version is %s.")
         varan-minreq-version emacs-version))

;; Load core module
(defvar varan-core-path (concat (file-name-directory load-file-name)
                                "core"))
(add-to-list 'load-path varan-core-path)
(require 'varan-core)
