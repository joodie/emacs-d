(defun add-to-epath (name path)
  (let ((current (getenv name)))
    (if (and current
             (not (member path (split-string current ":" t))))
        (if (string= current "")
            (setenv name path)
          (setenv name (concat path ":" current))))
    (getenv name)))

(when (file-directory-p "/opt/local/bin")
  (add-to-list 'exec-path "/opt/local/bin")
  (add-to-list 'load-path "/opt/local/share/doc/git-core/contrib/emacs")
  (add-to-epath "PATH" "/opt/local/bin")
  (add-to-epath "PATH" "/Library/Tcl/bin")
  (add-to-epath "INFOPATH" "/opt/local/share/info")
  (add-to-epath "MANPATH" "/opt/local/man"))

(setq my-ext-dir "~/.emacs.d/ext")
(add-to-list 'load-path my-ext-dir)

(defun add-ext-load-path (&rest ps)
  (dolist (p ps) 
    (add-to-list 'load-path (concat my-ext-dir "/" p))))

(provide 'init-load-path)
