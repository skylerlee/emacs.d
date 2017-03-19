;;; bootstrap.el -- emacs configuration bootstrap
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(add-to-list 'load-path (file-name-directory load-file-name))

(require 'varan-common)

(varan|define-directory "cache" "Directory storing cache files.")
(varan|define-directory "statics" "Directory storing static files.")
(varan|define-directory "templates" "Directory storing template files.")

(varan|define-directory "settings")
(varan|define-directory "themes")
(varan|define-directory "user")

(require 'varan-gui)
(require 'varan-editor)
(require 'varan-keybinding)
(require 'varan-settings)
(require 'varan-custom)
