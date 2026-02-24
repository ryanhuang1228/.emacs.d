;; UI设置

;; icons设置
(use-package nerd-icons
  :ensure t
  :custom
  ;; The Nerd Font you want to use in GUI
  ;; "Symbols Nerd Font Mono" is the default and is recommended
  ;; but you can use any other Nerd Font if you want
  (nerd-icons-font-family "Symbols Nerd Font Mono")
  )

;; 主题设置
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
  (load-theme 'doom-1337 t)
  ;; (doom-themes-visual-bell-config)
  ;; (doom-themes-treemacs-config)
)

;; modeline
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-window-width-limit 85
	doom-modeline-minor-modes t
	doom-modeline-mode-alist nil
	doom-modeline-buffer-file-name-style 'relative-from-project))
;; minions-mode
(use-package minions
  :ensure t
  :demand t
  :config
  (minions-mode 1))

;; emacs ui设置
(use-package emacs
  :if (display-graphic-p)
  :config

  (dolist (mode '(text-mode-hook prog-mode-hook conf-mode-hook))
    (add-hook mode
	      (lambda ()
		(progn
		  (display-line-numbers-mode t)
		  (setq display-line-numbers-type t)
		  (setq display-line-numbers-width-start t
			display-line-numbers-width 3
			display-line-numbers-grow-only t)))))
  
  (if *is-windows*
      (progn
	(set-face-attribute 'default nil
			    :font "Fira Code"
			    :height 160)
	;; (set-fontset-font t 'unicode (font-spec :family "Segoe UI Emoji") nil 'prepend)
	(dolist (charset '(kana han symbol cjk-misc bopomofo))
	  (setq face-font-rescale-alist `(("Microsoft YaHei Mono" . 1.3)))
	  (set-fontset-font t charset (font-spec :family "Microsoft YaHei Mono" :size 16))))
    (progn
      (set-face-attribute 'default nil :font "Menlo 16")
      ;; (set-fontset-font t 'unicode (font-spec :family "Apple Color Emoji") nil 'prepend)
      (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
			  charset (font-spec :family "Hei" :size 16))))
    ))


(provide 'init-ui)

