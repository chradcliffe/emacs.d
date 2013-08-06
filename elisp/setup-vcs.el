(global-unset-key (kbd "C-x m"))
(global-set-key (kbd "C-x m b") 'magit-blame-mode)

(require 'dsvn)

(provide 'setup-vcs)
