(require 'twiki)
(setq twiki-shell-cmd "~/.elisp/twikish")
(add-to-list 'auto-mode-alist '("\\.twiki\\'" . twiki-mode))

(provide 'setup-twiki)
