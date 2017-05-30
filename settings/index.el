;;; index.el -- settings module entrypoint
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(defvar varan-active-settings
  '(completion
    interaction
    snippet
    surround
    linter
    filetree
    modeline
    vcs
    misc))

(varan/load-code varan-active-settings)
