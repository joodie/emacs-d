(add-ext-load-path "smex")

(require 'smex)
(eval-after-load "~/.emacs.d/init.el" '(smex-initialize))

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c M-x") 'smex-update-and-run)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(provide 'topic-smex)
