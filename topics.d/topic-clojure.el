(add-ext-load-path "swank-clojure/src/emacs"
		   "clojure-mode"
		   "swank-clojure"
		   "slime")

(setq swank-clojure-binary "clj")

(require 'clojure-mode)
(require 'swank-clojure-autoload)
(require 'swank-clojure)
(require 'slime)

(setq slime-lisp-implementations
             `((sbcl ("sbcl"))
               (clojure (,swank-clojure-binary) :init swank-clojure-init))) 

(add-hook 'clojure-mode-hook 'slime-mode)

(add-hook 'clojure-mode-hook 'start-paredit)

(provide 'topic-clojure)
