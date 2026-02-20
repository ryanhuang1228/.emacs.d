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

(use-package evil
  :ensure t
  :demand t
  :config
  (evil-mode 1)
  (evil-define-key 'normal 'global (kbd "C-c e") 'evil-emacs-state)
  (evil-define-key 'emacs  'global (kbd "C-c e") 'evil-exit-emacs-state)
)

(provide 'init-package)
