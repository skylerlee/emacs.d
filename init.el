;;; emacs config
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;; Const definitions
(defconst varan-minreq-version "24.0" "Minimal emacs version required.")

;; Check version compatibility
(when (version< emacs-version varan-minreq-version)
  (error (concat "Require emacs version %s or above. "
                 "Your version is %s.")
         varan-minreq-version emacs-version))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" default)))
 '(package-selected-packages (quote (magit monokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
