(add-to-list 'load-path "~/.emacs.d")
(setq custom-file "~/.emacs.d/custom.el")
(require 'init-load-path)
(require 'init-ui)
(require 'init-topics)
(load custom-file)

;; don't ask me why, but this is the only way setting the cursor color
;; works on my emacs.app
(defun set-my-cursor-props (&rest frame)
  (run-at-time 0.1 nil 'set-face-attribute 'cursor nil :background "green")
  (run-at-time 0.2 nil 'set-face-attribute 'cursor nil :background "red"))
;; again, emacs.app loses its cursor config for new frames
(add-to-list 'after-make-frame-functions 'set-my-cursor-props)
(set-my-cursor-props)
(setq debug-on-error nil) ;; some stuff in ext/ apparently sets this

