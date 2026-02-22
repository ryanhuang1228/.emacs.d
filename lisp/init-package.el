;; 常用的package设置
(use-package restart-emacs)

(use-package undo-tree
  :ensure t
  :demand
  :config
  (global-undo-tree-mode t)
  (setq undo-tree-auto-save-history nil
	undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-history"))
	undo-tree-limit 1500))

(use-package evil
  :ensure t
  :demand t
  :init
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  (evil-define-key 'normal 'global (kbd "C-c e") 'evil-emacs-state)
  (evil-define-key 'emacs  'global (kbd "C-c e") 'evil-exit-emacs-state))

;; 多光标, g r前缀
(use-package evil-mc
  :ensure t
  :config
  (global-evil-mc-mode t))

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

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

;; 该包暂定，感觉用不上
(use-package proxy-mode
  :ensure t
  :custom ((proxy-mode-emacs-http-proxy
            '(("http"  . "127.0.0.1:7890")
              ("https" . "127.0.0.1:7890")
              ;; NOTE: don't use `localhost', avoid local server like robe no response
              ("no_proxy" . "127.0.0.1")))
           (proxy-mode-emacs-socks-proxy '("Default server" "127.0.0.1" 7890 5)))
  :commands (proxy-mode))

(provide 'init-package)
