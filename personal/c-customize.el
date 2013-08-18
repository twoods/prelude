;;; Set style to Allman (bsd)

(setq c-default-style "bsd"
      c-basic-offset 4)

;;; Use spaces instead of tabs
(defun my-prelude-c-mode-defaults ()
  (setq indent-tabs-mode nil))

(add-hook 'prelude-c-mode-common-hook 'my-prelude-c-mode-defaults t)


;;; Customize C keymap
(defun my-c-initialization-hook ()
  ;;; Use C specific line break on RETURN key
  (define-key c-mode-base-map (kbd "RET") 'c-context-line-break)
  (define-key c++-mode-map (kbd "RET") 'c-context-line-break))

(add-hook 'c-initialization-hook 'my-c-initialization-hook)
