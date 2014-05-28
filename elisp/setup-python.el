(require 'python)
(require 'highlight-indentation)
(add-hook 'python-mode-hook
          #'(lambda ()
              (define-key python-mode-map "\C-m" 'newline-and-indent)
              (whitespace-mode t)
              (highlight-indentation)))

(add-to-list 'auto-mode-alist '("wscript" . python-mode))

(provide 'setup-python)
