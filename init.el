(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))
(setq custom-file
      (expand-file-name "custom.el" user-emacs-directory))

(require 'init-base)
(require 'init-elpa)
(require 'init-ui)
(require 'init-dashboard)
(require 'init-navigation)
(require 'init-completion)
(require 'init-program)
(require 'init-package)
(require 'init-keybind)
(require 'init-ai)
