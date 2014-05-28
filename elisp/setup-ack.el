;; (require 'ack-and-a-half)
;; (defalias 'ack 'ack-and-a-half)
;; (defalias 'ack-same 'ack-and-a-half-same)
;; (defalias 'ack-find-file 'ack-and-a-half-find-file)
;; (defalias 'ack-find-file-same 'ack-and-a-half-find-file-same)
;; (setq ack-and-a-half-project-root-file-patterns '(".git\\'" ".codelite\\'"))

(setq ag-reuse-buffers 't)
(defalias 'ack 'ag-project)
(setq ag-highlight-search t)

(provide 'setup-ack)
