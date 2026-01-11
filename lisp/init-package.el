(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

(use-package restart-emacs)
(use-package gruvbox-theme
  :ensure t
  :init (load-theme 'gruvbox-dark-soft t))
(use-package smart-mode-line
  :ensure t
  :init
  (setq sml/no-confirm-load-theme t
	sml/theme 'respectful)
  (sml/setup))
(use-package emacs
  :config
  (setq dispaly-linej-numbers-type 'visual)
  (global-display-line-numbers-mode t))
(use-package emacs
  :if (display-graphic-p)
  :config
  (if *is-windows*
      (progn
	(set-face-attribute 'default nil
			    :font "Microsoft Yahei Mono"
			    :height 160)
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	  (set-fontset-font (frame-parameter nil 'font)
			    charset (font-spec :family "Sarasa Nerd" :size 16))))

      (set-face-attribute 'default nil :font "Source Code Pro for Powerline 11")))
    



(provide 'init-package)
