(add-ext-load-path "swank-clojure/src/emacs"
                   "clojure-mode"
                   "swank-clojure"
                   "slime")

(setq swank-clojure-binary "clj")
(setq package-activated-list ())
(require 'clojure-mode)
(require 'swank-clojure)
(require 'slime)



(slime-setup 
 '(slime-fancy ;; turns on fancy inspector, autodoc and other useful stuff
   slime-highlight-edits)) 

(add-hook 'clojure-mode-hook '(lambda ()
                                (slime-mode 1)
                                (start-paredit)))

(defun clojure (binary)
  (interactive "fbinary: ")
  (setq swank-clojure-binary (or binary "clj"))
  (setq slime-lisp-implementations
        `((clojure (,swank-clojure-binary) :init swank-clojure-init))) 
  (slime))

(provide 'topic-clojure)
