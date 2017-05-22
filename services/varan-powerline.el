;;; varan-powerline.el -- emacs powerline service
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(require 'powerline)

(defface varan-powerline-faded
  '((t (:foreground "grey40" :inherit powerline-active2)))
  "Powerline faded face."
  :group 'varan-powerline)

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

(defmacro varan|define-fragment (name &rest body)
  `(defun ,name ()
     (quote ,body)))

(put 'varan|define-fragment 'lisp-indent-function 'defun)

;; Define powerline fragments
(varan|define-fragment varan-pl-buffer-info
  (powerline-buffer-id title)
  (powerline-raw (if (buffer-modified-p) "+" " ") title)
  (varan//pl-sepl inner outer))

(varan|define-fragment varan-pl-version-control
  (powerline-vc outer 'r)
  (varan//pl-sepl outer blank))

(varan|define-fragment varan-pl-nyan-mode
  (when (bound-and-true-p nyan-mode)
    (powerline-raw (format " %s|" (nyan-create)) faded)))

(varan|define-fragment varan-pl-message
  (powerline-process faded 'r)
  (powerline-narrow faded 'r))

(varan|define-fragment varan-pl-editor-mode
  (powerline-major-mode blank 'r)
  (powerline-minor-modes blank 'r))

(varan|define-fragment varan-pl-buffer-extra-info
  (varan//pl-sepr blank outer)
  (powerline-raw (let* ((coding buffer-file-coding-system)
                        (base (coding-system-base coding))
                        (cate (coding-system-category coding))
                        (type (coding-system-eol-type coding))
                        (name (cond ((eq cate 'coding-category-undecided) "UTF-8")
                                    (t (upcase (symbol-name base)))))
                        (endl (cond ((eq type 0) "LF")
                                    ((eq type 1) "CRLF")
                                    ((eq type 2) "CR")
                                    (t "--"))))
                   (format " %s/%s " name endl))
                 outer))

(varan|define-fragment varan-pl-cursor-position
  (varan//pl-sepr outer inner)
  (powerline-raw (let* ((pm (point-max))
                        (ws (window-start))
                        (percent (/ (* 100.0 ws) pm)))
                   (format " %d%s " percent "%%"))
                 inner)
  (powerline-raw "%l:%c" inner 'r))

(defun varan//pl-integrate-main ()
  `(let* ((active (powerline-selected-window-active))
          (inner (if active 'mode-line 'mode-line-inactive))
          (title (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
          (outer (if active 'powerline-active1 'powerline-inactive1))
          (blank (if active 'powerline-active2 'powerline-inactive2))
          (faded 'varan-powerline-faded)
          (lhs ,(cons 'list
                      (append (varan-pl-buffer-info)
                              (varan-pl-version-control)
                              (varan-pl-nyan-mode))))
          (rhs ,(cons 'list
                      (append (varan-pl-message)
                              (varan-pl-editor-mode)
                              (varan-pl-buffer-extra-info)
                              (varan-pl-cursor-position)))))
     (concat (powerline-render lhs)
             (powerline-fill blank (powerline-width rhs))
             (powerline-render rhs))))

;;;###autoload
(defun varan/powerline-theme ()
  (interactive)
  (setq-default mode-line-format
                `("%e" (:eval ,(varan//pl-integrate-main)))))

(provide 'varan-powerline)
