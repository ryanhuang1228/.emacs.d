;; set font

;; 字体设置
(defun font-available-p (font-name)
  "Check font available with font-name."
  (find-font (font-spec :name font-name)))
(defun setup-fonts ()
  "Setup fonts." 
  (when (display-graphic-p)
    ;; Set default font
    (cl-loop for font in '(
			   "Fira Code"
			   "Cascadia Mono"
			   "Menlo"
			   )
	     when (font-available-p font)
	     return (set-face-attribute 'default nil
					:family font
					:height 160))
    ;; Set font for Chinese characters
    (cl-loop for font in '(
			   "Sarasa Mono SC"
			   "PingFang SC"
			   "Microsoft Yahei Mono"
			   )
	     when (font-available-p font)
	     return (progn
		      (setq face-font-rescale-alist `((,font . 1)))
		      (set-fontset-font t 'han (font-spec :family font))))
    ;; Specify font for all unicode characters
    (cl-loop for font in '("Apple Symbols" "Segoe UI Symbol" "Symbola" "Symbol")
             when (font-available-p font)
             return (set-fontset-font t 'symbol
				      (font-spec :family font)
				      nil 'prepend))

    ;; Set font for Emoji
    (cl-loop for font in '("Apple Color Emoji" "Segoe UI Emoji")
             when (font-available-p font)
             return (set-fontset-font t 'emoji
				      (font-spec :family font)
				      nil 'prepend))
  )
)

(use-package emacs
  :config
  (setq-default default-text-properties '(line-spacing 0.15
					  line-height 1.15))
  (setup-fonts))

(provide 'init-font)
