;; Disable automatic whitespace cleanup (prelude-programming)
;; (add-hook 'prelude-prog-mode-hook
;;           (lambda ()
;;             (remove-hook 'before-save-hook 'whitespace-cleanup t)) t)

;; Show trailing whitespace since cleanup is disabled
;; (setq-default show-trailing-whitespace t)

;; Disable automatic parens
(electric-pair-mode -1)
