;;; varan-gui.el -- emacs gui configurations
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Maximize frame by default
(setq default-frame-alist '((fullscreen . maximized)))

;; Disable the toolbar
(tool-bar-mode -1)

;; Turn off ring bell
(setq ring-bell-function 'ignore)

;; Show text pointer
(setq void-text-area-pointer 'text)

;; Change splash image
(setq fancy-splash-image
      (expand-file-name (concat varan-statics-directory "varan.png")))

(provide 'varan-gui)
