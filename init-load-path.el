(setq my-ext-dir "~/.emacs.d/ext")

(add-to-list 'load-path my-ext-dir)

(dolist (d (directory-files my-ext-dir))
  (let ((full-path (concat my-ext-dir "/" d)))
    (when (not (or (string= d ".") (string= d "..")))
      (when (file-directory-p full-path)
	(add-to-list 'load-path full-path)
	(dolist (subd (directory-files full-path))
	  (let ((subd-path (concat full-path "/" subd)))
	    (when (and (or (string= subd "elisp") (string= subd "lisp"))
		       (file-directory-p subd-path))
	      (add-to-list 'load-path subd-path))))))))

(provide 'init-load-path)
