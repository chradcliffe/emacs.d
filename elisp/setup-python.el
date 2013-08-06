(require 'python)
(add-hook 'python-mode-hook
          #'(lambda ()
              (define-key python-mode-map "\C-m" 'newline-and-indent)))

(add-to-list 'auto-mode-alist '("wscript" . python-mode))

(provide 'setup-python)
