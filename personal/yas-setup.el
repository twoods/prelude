;;; Set up yasnippet
(prelude-require-package 'yasnippet)
(require 'yasnippet)

;;; Create top level snippets to prevent warnings
(make-directory "~/.emacs.d/snippets" t)

;;; Keep snippets in personal directory
(add-to-list 'yas-snippet-dirs
             (expand-file-name "snippets" prelude-personal-dir))

;;; Disable yasnippet in term mode
(add-hook 'term-mode-hook (lambda () (yas-minor-mode -1)))

;;; Enable yasnippet mode globally
(yas-global-mode 1)
