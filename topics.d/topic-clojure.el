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

(setq slime-protocol-version 'ignore)

(slime-setup 
 '(slime-fancy ;; turns on fancy inspector, autodoc and other useful stuff
   slime-highlight-edits
   slime-company
   slime-complete-locals)) 

(add-hook 'clojure-mode-hook '(lambda ()
                                (slime-mode 1)
                                (start-paredit)
                                (company-mode 1)))

(setq slime-complete-symbol-function 'slime-complete-symbol*)

(defun clojure (binary)
  (interactive "fbinary: ")
  (setq swank-clojure-binary (or binary "clj"))
  (setq slime-lisp-implementations
        `((clojure (,swank-clojure-binary) :init swank-clojure-init))) 
  (slime))




(provide 'topic-clojure)
