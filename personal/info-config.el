;;; Custom info setup
;; In environment, set INFOPATH="~/info"

(add-hook 'Info-mode-hook
          (lambda ()
            (setq Info-additional-directory-list Info-default-directory-list)
            ))

;; Configure python lookup
(require 'pydoc-info)
;; (require 'info-look)

;; (info-lookup-add-help
;;  :mode 'python-mode
;;  :regexp "[[:alnum:]_]+"
;;  :doc-spec
;;  '(("(python.info)Index" nil "")))
