(use-package pyvenv
  :ensure t
  :hook (python-mode . pyvenv-tracking-mode)
  :config
  (pyvenv-mode 1)
  ;; 设置自动追踪虚拟环境
  (setq pyvenv-tracking-mode t))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-auto-guess-root t
	lsp-enable-completion-at-point t)
  :hook ((python-mode . lsp))
  :commands lsp)

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
         ("<tab>" . company-complete-selection))
        (:map lsp-mode-map
         ("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.5)  ;; 重要：给 LSP 一些时间
  (company-show-quick-access t)
  (company-tooltip-align-annotations t)
  (company-selection-wrap-around t)
  
  ;; 后端配置：确保 capf 在前
  (company-backends '(company-capf
                      company-keywords
                      company-semantic
                      company-files
                      company-dabbrev
                      company-yasnippet)))

(provide 'init-program)
