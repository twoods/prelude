;;; Set style to Allman (bsd)

(setq c-default-style "bsd"
      c-basic-offset 4)

;;; Use spaces instead of tabs
(defun my-prelude-c-mode-defaults ()
  (setq indent-tabs-mode nil))

(add-hook 'prelude-c-mode-common-hook 'my-prelude-c-mode-defaults t)
