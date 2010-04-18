;;; slime-company.el --- slime completion backend for company mode
;;
;; Based on slime-company.el by Ole Arndt, this file is maintained
;; to always be compatible with the latest ELPA Slime.
;;
;;; Installation.
;;
;; Add this to your .emacs:
;;
;;   (add-to-list 'load-path "<directory-of-this-file>")
;;   (add-hook 'slime-load-hook (lambda () (require 'slime-company)))
;;
;; or use: (slime-setup 'slime-fancy 'slime-company)
;;
;; I also have the following, IMO more convenient keybindings for
;; company mode in my .emacs:
;;
;;   (define-key company-active-map (kbd "\C-n") 'company-select-next)
;;   (define-key company-active-map (kbd "\C-p") 'company-select-previous)
;;   (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
;;   (define-key company-active-map (kbd "\C-v") 'company-show-location)
;;   (define-key company-active-map (kbd "<tab>") 'company-complete)
;;   (define-key company-active-map (kbd "\C-g") '(lambda ()
;;                                                  (interactive)
;;                                                  (company-abort)))
;;
;;; Code:

(require 'company)

(defsubst slime-company-active-p ()
  (derived-mode-p 'lisp-mode 'clojure-mode 'slime-repl-mode))

(defun slime-company-backend (command &optional arg &rest ignored)
  (case command
    ('prefix
     (if (slime-company-active-p)
         (company-grab-lisp-symbol)))
    ('candidates
     (first (slime-simple-completions (substring-no-properties arg))))
    ('meta
     (slime-eval `(swank:operator-arglist ,arg ,(slime-current-package))))
    ('doc-buffer
     (let ((doc (slime-eval `(swank:describe-symbol ,arg))))
       (with-current-buffer (company-doc-buffer)
         (insert doc)
         (goto-char (point-min))
         (current-buffer))))
    ('location
     (save-window-excursion
       (if (ignore-errors (slime-edit-definition arg))
           (cons (current-buffer) (point)))))))

(add-to-list 'company-backends 'slime-company-backend)

(add-hook 'company-completion-finished-hook
          (lambda (_) (if (slime-company-active-p) (slime-echo-arglist))))

(provide 'slime-company)

;;; slime-company.el ends here
