(add-to-list 'load-path "~/.emacs.d")
(setq custom-file "~/.emacs.d/custom.el")
(require 'init-load-path)
(require 'init-ui)
(require 'init-topics)
(load custom-file)

;; don't ask me why, but this is the only way setting the cursor color
;; works on my emacs.app
(run-at-time 1 nil 'set-face-attribute 'cursor nil :background "green")
(run-at-time 2 nil 'set-face-attribute 'cursor nil :background "red")
