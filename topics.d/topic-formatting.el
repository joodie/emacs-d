;; no tabs by default. modes that really need tabs should enable
;; indent-tabs-mode explicitly makefile-mode already does that, for
;; example.
(setq-default indent-tabs-mode nil)

;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks 
          (lambda () (if (not indent-tabs-mode)
                         (untabify (point-min) (point-max)))))


;; smart-tab makes <TAB> do intent-or-expand, intelligently

(add-ext-load-path "smart-tab")
(require 'smart-tab)
(global-smart-tab-mode 1)

(provide 'topic-formatting)
