;;; varan-modeline.el -- emacs modeline extension
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'powerline)

(defalias
  'varan//pl-sep-left
  (symbol-function (intern (format "powerline-%s-%s"
                                   (powerline-current-separator)
                                   (car powerline-default-separator-dir)))))

(defalias
  'varan//pl-sep-right
  (symbol-function (intern (format "powerline-%s-%s"
                                   (powerline-current-separator)
                                   (cdr powerline-default-separator-dir)))))

;;;###autoload
(defun varan/powerline-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (list "--")))))

(provide 'varan-powerline)
