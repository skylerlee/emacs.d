;;; varan-user.el -- emacs user data configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; User custom file
(setq custom-file (concat varan-user-directory "custom.el"))
(unless (file-exists-p custom-file)
  (copy-file (concat varan-templates-directory "custom.el") custom-file))

;; User customized theme location
(setq custom-theme-directory varan-user-directory)

(provide 'varan-user)
