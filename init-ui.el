(require 'cl)
(set-face-attribute 'default nil
                    :family "Inconsolata" :height (case system-type
                                                    ('gnu/linux 130)
                                                    ('darwin 145)) :weight 'normal)

(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1)) 

(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1)) 

(line-number-mode 1)
(column-number-mode 1)
(mouse-wheel-mode 1)
(setq inhibit-splash-screen t)
(setq show-paren-style 'expression)
(show-paren-mode 1)
(global-set-key (kbd "M-g") 'goto-line)
(fset 'yes-or-no-p 'y-or-n-p)
(setq default-indicate-empty-lines t)
(setq default-indicate-buffer-boundaries 'left)
(iswitchb-mode t)
(setq use-file-dialog nil)
(setq use-dialog-box nil)

;; do NOT iconify on C-z when running X
(defun iconify-or-deiconify-frame
  (interactive) 
  ())

(add-ext-load-path "color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-vim-colors)

(defvar mail-spool-file (concat "/var/spool/mail/" (getenv "USER")))
(setq display-time-24hr-format t
      display-time-day-and-date t
      display-time-mail-file (and (file-regular-p mail-spool-file)
                                  mail-spool-file))
(display-time)

(add-ext-load-path "iswitch-menu")
(require 'iswitch-menu)

(add-ext-load-path "elscreen" "apel")
(setq elscreen-display-tab nil)
(require 'elscreen)

(setq initial-scratch-message "")
(blink-cursor-mode 1)

;; otherwise, emacs.app won't recognize delete (fn-backspace)
(normal-erase-is-backspace-mode 1)

(require 'company)

(provide 'init-ui)

