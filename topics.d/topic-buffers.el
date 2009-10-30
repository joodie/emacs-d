(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("dired" (mode . dired-mode))
               ("perl" (or (mode . cperl-mode)
                           (name . "\.xs$")))
               ("erc" (mode . erc-mode))
               ("javascript" (or (mode . javascript-mode)
                                 (mode . js2-mode)))
               ("html" (mode html-mode))
               ("planner" (or
                           (name . "^\\*Calendar\\*$")
                           (name . "^diary$")
                           (mode . muse-mode)))
               ("lisp" (or
                        ( mode . lisp-mode )
                        ( mode . repl )
                        ( mode . slime-repl-mode )))

               ("elisp" (or
			 (mode . IELM)
                         (name . "^\\*scratch\\*$")
                         (mode . emacs-lisp-mode )
                         (name . "^\\*Messages\\*$")))

	       ("rails models" (filename . "/app/models/.*\\rb$"))
	       ("rails controllers" (filename . "/app/controllers/.*\\.rb$"))
	       ("rails views" (or (filename . "/app/views/")
				  (name . "\\.erb$")
				  (name . "\\.rhtml$")
				  (mode . rhtml-mode)))
	       ("rails helpers" (filename . "/app/helpers/.*\\.rb$"))
	       ("rails tests" (name . "_test.rb$"))
	       ("ruby" (name . "\\.rb$"))

               ("gnus" (or
                        (mode . message-mode)
                        (mode . bbdb-mode)
                        (mode . mail-mode)
                        (mode . gnus-group-mode)
                        (mode . gnus-summary-mode)
                        (mode . gnus-article-mode)
                        (name . "^\\.bbdb$")
                        (name . "^\\.newsrc-dribble")))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

(provide 'topic-buffers)
