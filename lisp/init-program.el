;; General
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
;; Python
(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-tracking-mode)
  :config
  (pyvenv-mode t)
  ;; 设置自动追踪虚拟环境
  (setq pyvenv-tracking-mode t)
;; 激活虚拟环境后自动更新 python-shell-interpreter
  (setq pyvenv-post-activate-hooks
        (list (lambda ()
                (setq python-shell-interpreter
                      (concat pyvenv-virtual-env
                              (if (eq system-type 'windows-nt)
                                  "Scripts/python.exe"
                                "/bin/python")))
                ;; 同时更新 exec-path
                (add-to-list 'exec-path
                            (concat pyvenv-virtual-env
                                    (if (eq system-type 'windows-nt)
                                        "Scripts"
                                      "/bin")))
                (message "Python interpreter set to: %s" python-shell-interpreter))))
 
  ;; 退出虚拟环境后恢复
  (setq pyvenv-post-deactivate-hooks
        (list (lambda ()
                (setq python-shell-interpreter "python")
                (message "Restored system Python interpreter"))))
)

(use-package lsp-mode
  :ensure t
  :init
  :hook
  (python-mode . lsp-deferred)
  :config
  (setq lsp-pylsp-plugins-pydocstyle-enabled nil
	lsp-auto-guess-root nil
	lsp-enable-completion-at-point t
	lsp-modeline-diagnostics-enable t
	lsp-diagnostics-provider :auto)
  :commands (lsp lsp-deferred))


;; (use-package lsp-pyright
;;   :ensure t
;;   :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-pyright)
;;                           (lsp-deferred))))  ; or lsp


(provide 'init-program)
