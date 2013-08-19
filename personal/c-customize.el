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


;;; Enable c-eldoc
(prelude-require-package 'c-eldoc)
(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)


;;; c-eldoc add include directories helper
;;; Based on https://github.com/brianjcj/auto-complete-clang/issues/20
(defun add-my-include-directories ()
  (interactive)
  (setq c-eldoc-includes
        (mapconcat #'(lambda (dir) (concat "-I" dir))
                   my-include-directories
                   " ")))


;;; Add include directories for c-eldoc - call from .dir-locals.el
(defun add-project-directories (&rest args)
  (defvar my-include-directories nil)
  (make-variable-buffer-local 'my-include-directories)
  (setq my-include-directories
        (mapcar (lambda (subdir)
                  (if (eq (elt subdir 0) ?/)
                      subdir
                    (concat (file-name-directory
                             (file-truename (locate-dominating-file
                                             buffer-file-name
                                             ".dir-locals.el")))
                            subdir)))
                args))
  (add-my-include-directories))

;;; Example: Add the following lines to .dir-locals.el
;; ((c-mode . ((eval . (add-project-directories "include/path/1/"
;;                                              "include/path/2/"
;;                                              "include/path/3/")))))
