(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 
	  (lambda () (require 'flymake) (flymake-mode 1) ;; use flymake 
	    (local-set-key (kbd "C-h f") 'cperl-perldoc))) ;; use perldoc inst +ead of info on C-h f

(provide 'topic-perl)
