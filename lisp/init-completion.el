(use-package ivy
  :ensure t
  :defer 1
  :hook (after-init . ivy-mode)
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil
	ivy-initial-inputs-alist nil
	ivy-count-format "%d/%d "
	enable-recursive-minibuffers t
	ivy-re-builders-alist '((t . ivy--regex-ignore-order))))
(use-package ivy-posframe
  :ensure t
  :after ivy
  :demand
  :config
  ;; 设置 posframe 显示在屏幕正中央
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  ;; 可选：设置窗口大小
  (setq ivy-posframe-parameters
        '((left . 0.5)
          (top . 0.3)
          (width . 100)
          (height . 10)))
  ;; 禁止根据内容自动调整大小
  (setq ivy-posframe-height 10)   ; 固定高度
  (setq ivy-posframe-width 100)    ; 固定宽度

  ;; (setq ivy-posframe-parameters '((left-fringe . 10)
  ;; 				  (right-fringe . 10)))
  (setq ivy-posframe-border-width 10)
  ;; 启用 ivy-posframe
  (ivy-posframe-mode 1))

(use-package counsel
  :after (ivy)
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper-isearch-backward))
  :config (setq swiper-action-recenter t
		swiper-include-line-number-in-search t))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode t))

(use-package company
  :ensure t
  :hook (after-init . global-company-mode)
  :bind
  (:map company-active-map
	("<tab>" . company-complete-selection))
  ;; (:map lsp-mode-map
  ;; 	("<tab>" . company-indent-or-complete-common))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.3)  ;; 重要：给 LSP 一些时间
  (company-show-quick-access t)
  (company-tooltip-align-annotations t)
  (company-selection-wrap-around t)
  (company-global-modes '(not eshell-mode))
  ;; 后端配置：确保 capf 在前
  (company-backends '(company-capf
                      company-keywords
                      company-semantic
                      company-files
                      company-dabbrev
                      company-yasnippet)))

(provide 'init-completion)
