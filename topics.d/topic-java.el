(add-ext-load-path "cedet/common")

(require 'cedet)
(global-ede-mode 1)
(add-ext-load-path "malabar-1.4.0/lisp")
(require 'malabar-mode)
(setq malabar-groovy-lib-dir "~/.emacs.d/ext/malabar-1.4.0/lib")

(add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))

(provide 'topic-java)
