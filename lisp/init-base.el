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
	(width . 150)
	(height . 50)))

;; emacs mode 设置
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)
(electric-pair-mode t)

;; emacs line number show up only in text-mode,
;; prog-mode and conf-mode.
(when (display-graphic-p)
  (dolist (mode '(text-mode-hook prog-mode-hook conf-mode-hook))
    (add-hook mode
	      (lambda ()
		(progn
		  (display-line-numbers-mode t)
		  (setq display-line-numbers-type t
			display-line-numbers-width-start t
			display-line-numbers-width 3
			display-line-numbers-grow-only t))))))




(provide 'init-base)



