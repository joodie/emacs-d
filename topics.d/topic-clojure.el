(add-to-list 'load-path "~/.emacs.d/ext/swank-clojure/src/emacs")
(setq swank-clojure-binary "clj")

(require 'clojure-mode)
(require 'swank-clojure-autoload)
(require 'swank-clojure)
(require 'slime)

(setq slime-lisp-implementations
             `((sbcl ("sbcl"))
               (clojure (,swank-clojure-binary) :init swank-clojure-init))) 

(add-hook 'clojure-mode-hook 'slime-mode)

(provide 'topic-clojure)
