(add-hook 'emacs-lisp-mode-hook 'start-paredit)
(add-hook 'ielm-mode-hook 'start-paredit)

(add-hook 'emacs-lisp-mode-hook (lambda ()
                                  (define-key emacs-lisp-mode-map "\C-c\C-k"
                                    #'eval-buffer)
                                  (define-key emacs-lisp-mode-map "\C-x\C-e"
                                    #'eval-last-sexp)))

(provide 'topic-elisp)

