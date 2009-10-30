(set-face-attribute 'default nil
		    :family "Inconsolata" :height 140 :weight 'normal)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(line-number-mode 1)
(column-number-mode 1)
(mouse-wheel-mode 1)
(setq inhibit-splash-screen t)
(setq show-paren-style 'expression)
(global-set-key (kbd "M-g") 'goto-line)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-indicate-empty-lines t)
(setq default-indicate-buffer-boundaries t)
(ido-mode t)

;; do NOT iconify on C-z when running X
(defun iconify-or-deiconify-frame
  (interactive) 
  ())

(require 'color-theme)
(color-theme-initialize)
(color-theme-vim-colors)


(provide 'init-ui)

