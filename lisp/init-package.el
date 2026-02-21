(use-package restart-emacs)

(use-package treemacs
  :ensure t   ; 确保通过 MELPA 安装
  :defer t    ; 延迟加载，提升 Emacs 启动速度
  :config
  ;; (setq treemacs-position 'left)
  ;; 基本视觉与行为设置
  (setq treemacs-width 35)           ; 设置侧边栏宽度为35，可根据喜好调整
  (treemacs-follow-mode t)           ; 自动在侧边栏定位当前打开的文件
  (treemacs-filewatch-mode t)        ; 当文件系统有变化时自动刷新
  (treemacs-git-mode -1)
  (define-key treemacs-mode-map (kbd "C-c c f") #'treemacs-create-file)
  (define-key treemacs-mode-map (kbd "C-c c d") #'treemacs-create-dir)
  (define-key treemacs-mode-map (kbd "C-c r") #'treemacs-rename-file)
  (define-key treemacs-mode-map (kbd "C-c d") #'treemacs-delete-file)
  (define-key treemacs-mode-map (kbd "C-c y y") #'treemacs-copy-file)
  (define-key treemacs-mode-map (kbd "C-c m") #'treemacs-move-file)
  (define-key treemacs-mode-map (kbd "C-c y a") #'treemacs-copy-absolute-path-at-point)
  (define-key treemacs-mode-map (kbd "C-c y r") #'treemacs-copy-relative-path-at-point)
  (define-key treemacs-mode-map (kbd "C-c y p") #'treemacs-copy-project-path-at-point)
  
  :bind
  ("C-\\" . treemacs))

(use-package undo-tree
  :ensure t
  :demand
  :config
  (global-undo-tree-mode t)
  (setq undo-tree-auto-save-history nil
	undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-history"))
	undo-tree-limit 1500
  )
)

(use-package evil
  :ensure t
  :demand t
  :init
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  (evil-define-key 'normal 'global (kbd "C-c e") 'evil-emacs-state)
  (evil-define-key 'emacs  'global (kbd "C-c e") 'evil-exit-emacs-state)
)

(use-package popper
  :ensure t
  :init
  (setq popper-mode-line t
	popper-display-control nil
	popper-reference-buffers '("^\\*eshell\\*$"
				   "^\\*eshell\\*<[0-9]+>$"
				   "^\\*Messages\\*$"
				   "^\\*Warnings\\*$"
				   "^\\*compilation\\*$"))
  (popper-mode t)
  (popper-echo-mode t)
  ;; 通过 Emacs 原生机制设置弹出窗口高度
  (add-to-list 'display-buffer-alist
	       (list (mapconcat 'identity popper-reference-buffers "\\|")
		     '(display-buffer-in-direction)
		     '(direction . bottom)
		     '(window-height . 0.3)))  ;; 30% 高度

  :config
  (setq popper-group-function #'popper-group-by-directory)
  :bind
  (("C-`" . popper-toggle)
   ("C-<tab>" . popper-cycle)))

(use-package which-key
  :ensure t
  :init (which-key-mode t))


(provide 'init-package)
