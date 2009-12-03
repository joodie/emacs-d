(add-ext-load-path "swank-clojure/src/emacs"
                   "clojure-mode"
                   "swank-clojure"
                   "slime")

(setq swank-clojure-binary "clj")

(require 'clojure-mode)
(require 'swank-clojure-autoload)
(require 'swank-clojure)
(require 'slime)

(add-hook 'clojure-mode-hook 'slime-mode)

(add-hook 'clojure-mode-hook 'start-paredit)

(slime-setup 
 '(slime-fancy ;; turns on fancy inspector, autodoc and other useful stuff
   slime-highlight-edits)) 

(defun clojure (binary)
  (interactive "fbinary: ")
  (setq swank-clojure-binary (or binary "clj"))
  (setq slime-lisp-implementations
        `((clojure (,swank-clojure-binary) :init swank-clojure-init))) 
  (slime))

(provide 'topic-clojure)
