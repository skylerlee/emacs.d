;;; varan-modeline.el -- emacs modeline extension
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

;;;###autoload
(defun varan/powerline-theme ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (list "--")))))

(provide 'varan-powerline)
