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

;; Load bootstrap file
(load (concat (file-name-directory load-file-name)
              "core/varan-bootstrap"))

;; Load core module
(add-to-list 'load-path varan-core-directory)
(require 'varan-core)

;; Load user custom file
(load custom-file)
