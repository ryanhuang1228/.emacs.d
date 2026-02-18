(use-package restart-emacs)

(use-package treemacs
  :ensure t   ; 确保通过 MELPA 安装
  :defer t    ; 延迟加载，提升 Emacs 启动速度
  :config
  ;; 基本视觉与行为设置
  (setq treemacs-width 35)           ; 设置侧边栏宽度为35，可根据喜好调整
  (setq treemacs-is-neotree-silent t); 模仿neotree的安静模式
  (treemacs-follow-mode t)           ; 自动在侧边栏定位当前打开的文件
  (treemacs-filewatch-mode t)        ; 当文件系统有变化时自动刷新
  (treemacs-git-mode -1)
  :bind
  ("C-\\" . treemacs))

(use-package evil
  :ensure t
  :demand t
  :config
  (evil-mode 1)
  (evil-define-key 'normal 'global (kbd "C-c e") 'evil-emacs-state)
  (evil-define-key 'emacs  'global (kbd "C-c e") 'evil-exit-emacs-state))

(provide 'init-package)
