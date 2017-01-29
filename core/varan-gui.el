;;; varan-gui.el -- emacs gui configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Maximize frame by default
(setq default-frame-alist '((fullscreen . maximized)))

;; Disable the toolbar
(tool-bar-mode -1)

;; Turn off the bell
(setq ring-bell-function 'ignore)

(provide 'varan-gui)
