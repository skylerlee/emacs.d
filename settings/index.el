;;; index.el -- settings module entrypoint
;;
;; Copyright (C) 2016, Skyler.
;; MIT License.

(defvar varan-active-settings
  '(keybinding
    completion
    interaction
    snippet
    enclosure
    linter
    filetree
    modeline
    vcs
    misc))

(varan/load-code varan-active-settings)
