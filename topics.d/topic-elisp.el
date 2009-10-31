(add-hook 'emacs-lisp-mode-hook
	  (lambda () (paredit-mode +1)))
(add-hook 'ielm-mode-hook 
	  (lambda () (paredit-mode +1)))

(provide 'topic-elisp)

