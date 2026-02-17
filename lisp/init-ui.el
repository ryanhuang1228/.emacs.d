;; (use-package all-the-icons
;;   :ensure t
;;   :demand t
;;   :if (display-graphic-p))

(use-package nerd-icons
  ;; :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  ;; (nerd-icons-font-family "Symbols Nerd Font Mono")
  )
(use-package dashboard
  :ensure t
  :demand t
  :config
  (setq dashboard-startup-banner 'logo
	dashboard-center-content t
	dashboard-icon-type 'nerd-icons
	dashboard-set-file-icons t
	dashboard-set-heading-icons t)
  (dashboard-modify-heading-icons '((recents   . "nf-oct-file")
                                    (bookmarks . "nf-oct-bookmark")
				    (agenda    . "nf-oct-checklist")))
  (dashboard-setup-startup-hook))

;; (use-package gruvbox-theme
;;   :ensure t
;;   :init (load-theme 'gruvbox-dark-soft t))
(use-package doom-themes
  :ensure t
  :demand t
  :custom
  ;; Global settings (defaults)
  (doom-themes-enable-bold t)   ; if nil, bold is universally disabled
  (doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; for treemacs users
  (doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  :config
  (load-theme 'doom-one t)

  (doom-themes-visual-bell-config)
  ;; (doom-themes-treemacs-config)
)

;; (use-package smart-mode-line
;;   :ensure t
;;   :init
;;   (setq sml/no-confirm-load-theme t
;; 	sml/theme 'respectful)
;;   (sml/setup))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-window-width-limit 85
	doom-modeline-minor-modes t
	doom-modeline-mode-alist nil
	doom-modeline-buffer-file-name-style 'relative-from-project)
)



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
    (progn
      (set-face-attribute 'default nil :font "Menlo 16")
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
			  charset (font-spec :family "Hei" :size 16))))
    ))


(provide 'init-ui)
