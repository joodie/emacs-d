(require 'espresso)

(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))

(add-hook 'espresso-mode-hook
          (lambda () (paredit-mode 1)))

(provide 'topic-javascript)
