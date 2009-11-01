(setq my-topics-dir "~/.emacs.d/topics.d")

(add-to-list 'load-path my-topics-dir )

(dolist (f (directory-files my-topics-dir))
  (let ((full-path (concat my-topics-dir "/" f)))
    (when (and (file-regular-p full-path)
	     (string-match "\\(topic-.*\\)\\.el$" f))
      (let ((req (match-string 1 f)))
	(require (intern req))))))

(provide 'init-topics)
