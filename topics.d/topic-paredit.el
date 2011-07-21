(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)

(defun start-paredit ()
  (paredit-mode +1))

(provide 'topic-paredit)
