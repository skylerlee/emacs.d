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

;; Define powerline fragments
(defun varan//pl-frag-buffer-info ()
  '((powerline-buffer-id title)
    (powerline-raw (if (buffer-modified-p) "+" " ") title)
    (varan//pl-sepl inner outer)))

(defun varan//pl-frag-version-control ()
  '((powerline-vc outer 'r)
    (varan//pl-sepl outer blank)))

(defun varan//pl-frag-nyan-mode ()
  '((when (bound-and-true-p nyan-mode)
      (powerline-raw (format " %s|" (nyan-create)) faded))))

(defun varan//pl-frag-buffer-extra-info ()
  '((varan//pl-sepr blank outer)
    (powerline-raw (let* ((coding buffer-file-coding-system)
                          (base (coding-system-base coding))
                          (type (coding-system-eol-type coding))
                          (endl (cond ((eq type 0) "LF")
                                      ((eq type 1) "CRLF")
                                      ((eq type 2) "CR")
                                      (t "--"))))
                     (format " %s/%s " base endl))
                   outer)))

(defun varan//pl-frag-cursor-position ()
  '((varan//pl-sepr outer inner)
    (powerline-raw (let* ((pm (point-max))
                          (ws (window-start))
                          (percent (/ (* 100.0 ws) pm)))
                     (format " %d%s " percent "%%"))
                   inner)
    (powerline-raw "%l:%c" inner 'r)))

(defun varan//pl-integrate-main ()
  `(let* ((active (powerline-selected-window-active))
          (inner (if active 'mode-line 'mode-line-inactive))
          (title (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
          (outer (if active 'powerline-active1 'powerline-inactive1))
          (blank (if active 'powerline-active2 'powerline-inactive2))
          (faded 'varan-powerline-faded)
          (lhs ,(cons 'list
                      (append (varan//pl-frag-buffer-info)
                              (varan//pl-frag-version-control)
                              (varan//pl-frag-nyan-mode))))
          (rhs ,(cons 'list
                      (append (varan//pl-frag-buffer-extra-info)
                              (varan//pl-frag-cursor-position)))))
     (concat (powerline-render lhs)
             (powerline-fill blank (powerline-width rhs))
             (powerline-render rhs))))

;;;###autoload
(defun varan/powerline-theme ()
  (interactive)
  (setq-default mode-line-format
                `("%e" (:eval ,(varan//pl-integrate-main)))))

(provide 'varan-powerline)
