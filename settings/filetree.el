(use-package neotree
  :init
  (setq neo-theme 'icons
        neo-smart-open t)
  :general
  ("<f8>" 'neotree-toggle)
  (:keymaps 'evil-normal-state-map
            :prefix ","
            "ft" 'neotree-show))

(use-package all-the-icons)
