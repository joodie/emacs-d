(add-hook 'emacs-lisp-mode-hook 'start-paredit)
(add-hook 'ielm-mode-hook 'start-paredit)

(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (define-key emacs-lisp-mode-map "\C-ck"
						 (lambda () (message (eval-buffer))))
				  (define-key emacs-lisp-mode-map "\C-cc"
						 #'eval-last-sexp)))

(provide 'topic-elisp)

