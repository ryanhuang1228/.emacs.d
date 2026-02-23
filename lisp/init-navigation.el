;; 文件导航栏设置

(use-package treemacs
  :ensure t   ; 确保通过 MELPA 安装
  :defer t    ; 延迟加载，提升 Emacs 启动速度
  :config
  ;; (setq treemacs-position 'left)
  ;; 基本视觉与行为设置
  (setq treemacs-width 30)           ; 设置侧边栏宽度为35，可根据喜好调整
  (treemacs-follow-mode t)           ; 自动在侧边栏定位当前打开的文件
  (treemacs-filewatch-mode t)        ; 当文件系统有变化时自动刷新
  (treemacs-git-mode -1)

  ;; 方案：将 src 的特殊图标改为普通文件夹图标
  (with-eval-after-load 'treemacs
    ;; 等待 treemacs 完全加载后修改图标配置
    (let ((gui-icons (treemacs-theme->gui-icons treemacs--current-theme)))
      ;; 将 src 的图标设置为 nil，让它们使用默认的文件夹图标
      (ht-set! gui-icons "src-open" nil)
      (ht-set! gui-icons "src-closed" nil)))

  (define-key treemacs-mode-map (kbd "C-c c f") #'treemacs-create-file)
  (define-key treemacs-mode-map (kbd "C-c c d") #'treemacs-create-dir)
  (define-key treemacs-mode-map (kbd "C-c r")   #'treemacs-rename-file)
  (define-key treemacs-mode-map (kbd "C-c d")   #'treemacs-delete-file)
  (define-key treemacs-mode-map (kbd "C-c y y") #'treemacs-copy-file)
  (define-key treemacs-mode-map (kbd "C-c m")   #'treemacs-move-file)
  (define-key treemacs-mode-map (kbd "C-c y a") #'treemacs-copy-absolute-path-at-point)
  (define-key treemacs-mode-map (kbd "C-c y r") #'treemacs-copy-relative-path-at-point)
  (define-key treemacs-mode-map (kbd "C-c y p") #'treemacs-copy-project-path-at-point)
  :bind
  ("C-\\" . treemacs))

(provide 'init-navigation)
