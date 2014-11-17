(require 'python)
(require 'highlight-indentation)
(add-hook 'python-mode-hook
          #'(lambda ()
              ;; (define-key python-mode-map "\C-m" 'newline-and-indent)
              (whitespace-mode t)
              (highlight-indentation-mode)))
(require 'python-mode)
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("wscript" . python-mode))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(provide 'setup-python)
