;; dashboard设置
(use-package dashboard
  :ensure t
  :demand t
  :after nerd-icons
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

(provide 'init-dashboard)
