(add-ext-load-path "swank-clojure/src/emacs"
                   "clojure-mode"
                   "swank-clojure"
                   "slime"
                   "slime-complete-locals")

(setq swank-clojure-binary "clj")
(setq package-activated-list ())
(require 'clojure-mode)
(require 'swank-clojure)
(require 'slime)
(require 'highlight-parentheses)

(setq slime-protocol-version 'ignore)

(slime-setup 
 '(slime-fancy ;; turns on fancy inspector, autodoc and other useful stuff
   slime-highlight-edits
   slime-company
   slime-complete-locals)) 

(add-hook 'clojure-mode-hook '(lambda ()
                                (slime-mode 1)
                                (start-paredit)
                                (highlight-parentheses-mode 1)
                                (company-mode 1)))

(setq slime-complete-symbol-function 'slime-complete-symbol*)

;; based on http://github.com/purcell/emacs.d/blob/master/init-clojure.el

(defun slime-clojure-repl-setup ()
  (when (string-equal "clojure" (slime-connection-name))
    (message "Setting up repl for clojure")
    (when (slime-inferior-process)
      (slime-redirect-inferior-output))
    (paredit-mode 1)
    (set-syntax-table clojure-mode-syntax-table)
    (clojure-mode-font-lock-setup)

    (setq lisp-indent-function 'clojure-indent-function)

    (when (and (featurep 'paredit) paredit-mode (>= paredit-version 21))
      (define-key slime-repl-mode-map "{" 'paredit-open-curly)
      (define-key slime-repl-mode-map "}" 'paredit-close-curly))))

(add-hook 'slime-repl-mode-hook 'slime-clojure-repl-setup)



(defun lein-swank ()
  (interactive)
  (let ((root (locate-dominating-file default-directory "project.clj")))
    (when (not root)
      (error "Not in a Leiningen project."))
    ;; you can customize slime-port using .dir-locals.el
    (shell-command (format "cd %s && lein swank %s &" root slime-port)
                   "*lein-swank*")
    (set-process-filter (get-buffer-process "*lein-swank*")
                        (lambda (process output)
                          (when (string-match "Connection opened on" output)
                            (slime-connect "localhost" slime-port)
                            (set-process-filter process nil))))
    (message "Starting swank server...")))

(provide 'topic-clojure)
