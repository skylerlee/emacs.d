;;; varan-powerline.el -- emacs powerline service
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

(defun varan//pl-integrate-main ()
  `(let* ((active (powerline-selected-window-active))
          (inner (if active 'mode-line 'mode-line-inactive))
          (title (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
          (outer (if active 'powerline-active1 'powerline-inactive1))
          (blank (if active 'powerline-active2 'powerline-inactive2))
          (lhs (list
                (powerline-raw "%*" inner 'l)))
          (rhs (list
                (powerline-raw "--" inner 'r))))
     (concat (powerline-render lhs)
             (powerline-fill blank (powerline-width rhs))
             (powerline-render rhs))))

;;;###autoload
(defun varan/powerline-theme ()
  (interactive)
  (setq-default mode-line-format
                `("%e" (:eval ,(varan//pl-integrate-main)))))

(provide 'varan-powerline)
