;; Use etags-select and etags-select
(prelude-require-package 'etags-table)
(require 'etags-select)
(require 'etags-table)
(setq etags-table-search-up-depth 10)

(global-set-key (kbd "M-.") 'etags-select-find-tag)
(global-set-key (kbd "C-.") 'etags-select-find-tag-at-point)
(global-set-key (kbd "C-,") 'pop-tag-mark)

;; Disable overridden key bindings in flyspell
(require 'flyspell)
(define-key flyspell-mode-map (kbd "C-.") nil)
(define-key flyspell-mode-map (kbd "C-,") nil)
