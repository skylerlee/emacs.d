;;; varan-core.el -- core module entrypoint
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'varan-gui)

;; Set custom file path
(setq custom-file (concat varan-core-directory
                          "varan-user.el"))
(load custom-file)

(provide 'varan-core)
