(add-ext-load-path "swank-clojure/src/emacs"
                   "clojure-mode"
                   "swank-clojure"
                   "slime")

(setq swank-clojure-binary "clj")
(setq package-activated-list ())
(require 'clojure-mode)
(require 'swank-clojure)
(require 'slime)
(require 'slime-company)
(setq slime-protocol-version 'ignore)
(slime-setup 
 '(slime-fancy ;; turns on fancy inspector, autodoc and other useful stuff
   slime-highlight-edits
   slime-company)) 

(add-hook 'clojure-mode-hook '(lambda ()
                                (slime-mode 1)
                                (start-paredit)
                                (company-mode 1)))

(defun clojure (binary)
  (interactive "fbinary: ")
  (setq swank-clojure-binary (or binary "clj"))
  (setq slime-lisp-implementations
        `((clojure (,swank-clojure-binary) :init swank-clojure-init))) 
  (slime))

(setq slime-string-literal-regexp
  "\".*?[^\\]\"")

(setq slime-comment-regexp
  ";.*")

(setq slime-not-a-symbol-regexp
  "[][(){}]+")

(defun slime-get-local-symbols-buffer
  ()
  (save-excursion
    (let ((b (get-buffer-create "*slime-local-symbols-buffer*")))
      (set-buffer b)
      (erase-buffer)
      b)))

(defun slime-uniq-list (list)
  (let ((result '()))
    (dolist (elem list)
      (when (not (member elem result))
        (push elem result)))
    (nreverse result)))

;; this is pretty hackish. should be fairly quick, though
(defun slime-local-symbols
  ()
  (interactive)
  (save-excursion
    (destructuring-bind (s e) (slime-region-for-defun-at-point)
      (let ((tmp (slime-get-local-symbols-buffer)))
        (copy-to-buffer tmp s e)
        (set-buffer tmp)
        (set-text-properties 1 (point-max)  nil)
        (replace-regexp slime-string-literal-regexp " ")
        (beginning-of-buffer)
        (replace-regexp slime-comment-regexp "")
        (beginning-of-buffer)
        (replace-regexp slime-not-a-symbol-regexp " ")
        (slime-uniq-list (split-string (buffer-string)))))))

(defun slime-filter (condp lst)
  (delq nil
        (mapcar (lambda (x) (and (funcall condp x) x)) lst)))

(defun slime-simple-local-completions (prefix)
  (let ((len (length prefix)))
    (slime-filter (lambda (str) 
                    (and (<= len (length x))
                         (string= prefix (substring str 0 len))))
                  (slime-local-symbols))))

(defun slime-add-simple-local-completions (prefix lst)
  (cons 
   (sort (slime-uniq-list (append (slime-simple-local-completions prefix) (car lst))) 
         (lambda (a b) (compare-strings a 0 nil b 0 nil))) 
   (cdr lst)))


(defadvice slime-simple-completions (around include-local-symbols (prefix))
  "include symbols from the current top-level form in the completion suggestions"
  ad-do-it
  (setq ad-return-value (slime-add-simple-local-completions prefix ad-return-value)))

(ad-activate 'slime-simple-completions)

(setq slime-complete-symbol-function 'slime-simple-complete-symbol)

(provide 'topic-clojure)
