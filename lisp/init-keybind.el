(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

;; (defalias 'yes-or-no-p 'y-or-n-p)
(setq use-short-answers t)

(use-package crux
  :bind ("C-k" . crux-smart-kill-line)
  :bind ("C-a" . crux-move-beginning-of-line)
  )

(use-package drag-stuff
  :bind (("<M-up>" . drag-stuff-up)
	 ("<M-down>" . drag-stuff-down)))

(provide 'init-keybind)
