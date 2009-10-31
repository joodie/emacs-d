(require 'flymake)
(require 'flymake-extension)
(add-hook 'flymake-mode-hook
	  (lambda ()
	    (local-set-key (kbd "M-n") 'flymake-show-next-error)
	    (local-set-key (kbd "M-p") 'flymake-show-prev-error)))

(setq flymake-extension-use-showtip t)
(setq flymake-extension-auto-show nil)

(add-ext-load-path "egg")
(require 'egg)

(provide 'topic-programming)
