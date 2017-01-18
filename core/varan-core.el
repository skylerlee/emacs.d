;;; varan-core.el -- core module entrypoint
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'varan-gui)
(require 'varan-editor)
(require 'varan-package)

;; Load custom file
(setq custom-file
      (expand-file-name (concat varan-root-directory
                                "user/varan-custom.el")))
(load custom-file)

(provide 'varan-core)
