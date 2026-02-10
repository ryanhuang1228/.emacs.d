(use-package all-the-icons
  :ensure t
  :demand t
  :if (display-graphic-p))
(use-package dashboard
  :ensure t
  :demand t
  :config
  (setq dashboard-startup-banner 'logo
	dashboard-center-content t
	dashboard-icon-type 'all-the-icons
	dashboard-set-file-icons t
	dashboard-set-heading-icons t)
  (dashboard-modify-heading-icons '((recents   . "file-text")
                                    (bookmarks . "book")))
  (dashboard-setup-startup-hook))

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

      (set-face-attribute 'default nil :font "Menlo 16")))

(provide 'init-ui)
