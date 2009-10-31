(autoload 'paredit-mode "paredit"
      "Minor mode for pseudo-structurally editing Lisp code." t)

(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "<C-left>") 'paredit-backward)
     (define-key paredit-mode-map (kbd "<C-right>") 'paredit-forward)))


(defun start-paredit ()
  (paredit-mode +1))

(provide 'topic-paredit)
