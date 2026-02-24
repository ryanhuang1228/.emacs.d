;; const变量定义
(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

;; 编码规则定义
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

;; emacs启动设置
(setq gc-cons-threshold most-positive-fixnum)
(setq echo-keystrokes 0.1)
(setq auto-save-default nil)  ;; 关闭自动保存
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)
(setq initial-frame-alist
      '((top . 0.5)
	(left . 0.5)
	(width . 120)
	(height . 40)))

;; emacs内置Mode设置
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(electric-pair-mode t)

(provide 'init-base)



