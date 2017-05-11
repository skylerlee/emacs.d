;;; varan-powerline.el -- emacs powerline service
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'powerline)

(defalias
  'varan//pl-sepl
  (symbol-function (intern (format "powerline-%s-%s"
                                   (powerline-current-separator)
                                   (car powerline-default-separator-dir)))))

(defalias
  'varan//pl-sepr
  (symbol-function (intern (format "powerline-%s-%s"
                                   (powerline-current-separator)
                                   (cdr powerline-default-separator-dir)))))

;; Define powerline fragments
(defun varan//pl-frag-buffer-info ()
  '((powerline-buffer-id title)
    (powerline-raw (if (buffer-modified-p) "+" " ") title)
    (varan//pl-sepl inner outer)))

(defun varan//pl-frag-cursor-position ()
  '((varan//pl-sepr outer inner)
    (powerline-raw (let* ((pm (point-max))
                          (ws (window-start))
                          (percent (/ (* 100.0 ws) pm)))
                     (format " %d" percent))
                   inner)
    (powerline-raw "%% ")
    (powerline-raw "%l:%c" inner 'r)))

(defun varan//pl-integrate-main ()
  `(let* ((active (powerline-selected-window-active))
          (inner (if active 'mode-line 'mode-line-inactive))
          (title (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
          (outer (if active 'powerline-active1 'powerline-inactive1))
          (blank (if active 'powerline-active2 'powerline-inactive2))
          (lhs ,(cons 'list
                      (append (varan//pl-frag-buffer-info))))
          (rhs ,(cons 'list
                      (append (varan//pl-frag-cursor-position)))))
     (concat (powerline-render lhs)
             (powerline-fill blank (powerline-width rhs))
             (powerline-render rhs))))

;;;###autoload
(defun varan/powerline-theme ()
  (interactive)
  (setq-default mode-line-format
                `("%e" (:eval ,(varan//pl-integrate-main)))))

(provide 'varan-powerline)
