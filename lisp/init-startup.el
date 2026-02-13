(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

(setq gc-cons-threshold most-positive-fixnum)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq initial-frame-alist
      '((top . 0.5)
	(left . 0.5)
	(width . 120)
	(height . 40)))


(provide 'init-startup)
