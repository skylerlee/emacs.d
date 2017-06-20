;;; varan-leader.el -- emacs leader service
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(defvar varan-leader--default-map (make-sparse-keymap))

(defgroup varan-leader nil
  "Leader key feature support for varan."
  :prefix 'varan-leader-
  :group 'varan)

(defcustom varan-leader-normal-prefix ","
  "Prefix for the leader-keymap used in normal state."
  :type 'string
  :group 'varan-leader)

(defcustom varan-leader-non-normal-prefix "C-,"
  "Prefix for the leader-keymap used in emacs and insert states."
  :type 'string
  :group 'varan-leader)

(provide 'varan-leader)
