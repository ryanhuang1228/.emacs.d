; 内容补全和提示设置

(use-package orderless
  :ensure t
  :demand
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles partial-completion))))
  (completion-pcm-leading-wildcard t)) ;; Emacs 31: partial-completion behaves like substring

(use-package marginalia
  :ensure t
  :demand
  :init
  (marginalia-mode t))

(use-package vertico
  :ensure t
  :init
  ;; You'll want to make sure that e.g. fido-mode isn't enabled
  (vertico-mode)
  :bind
  (:map vertico-map
	("C-j" . vertico-next)
	("C-k" . vertico-previous))
)

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode)
  (corfu-popupinfo-mode)
  :custom
  ;; corfu
  (corfu-auto t)
  (corfu-auto-delay 0.2)
  (corfu-cycle t)
  ;; (corfu-separator ?_) ;; Set to orderless separator, if not using space
  (corfu-auto-prefix 2)
  (corfu-preselect 'prompt)
  ;; (corfu-auto-trigger ".") ;; Custom trigger characters
  (corfu-quit-no-match t) ;; or t

  ;;corfu-popupinfo
  (corfu-popupinfo-delay '(0.25 . 0.1))
  (corfu-popupinfo-hide nil)
  :bind
  (:map
   corfu-map
   ("TAB" . corfu-next)
   ([tab] . corfu-next)
   ("S-TAB" . corfu-previous)
   ("SPC" . corfu-insert-separator)
   ([backtab] . corfu-previous)))
;;  ;; ("TAB" . corfu-next)           ; Tab to select next
;;  ;; ("<backtab>" . corfu-previous) ; Shift-Tab to select previous
;; ("C-n" . corfu-next) ("C-p" . corfu-previous)))

;; Fancy completion-at-point functions; there's too much in the cape package to
;; configure here; dive in when you're comfortable!
(use-package cape
  :ensure t
  :defer t
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  ;; (add-to-list 'completion-at-point-functions #'cape-elisp-symbol)

)

(use-package consult
  :ensure t
  :bind (
	 ("C-x b" . consult-buffer)
	 ("M-y" . consult-yank-pop)
	 ("C-s" . consult-line)
	 ))

(use-package embark
  :ensure t
  :bind (("C-c a" . embark-act)))
(use-package embark-consult :ensure t)

(provide 'init-completion)
