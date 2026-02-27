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
  (minions-mode t))


(provide 'init-ui)

