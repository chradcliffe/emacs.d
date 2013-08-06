(c-add-style "company"
             '("k&r"
               (c-offsets-alist
                (member-init-intro . ++)
                (arglist-cont-nonempty . ++)
                (arglist-cont . ++)
                (arglist-intro . ++)
                (template-args-cont . ++)
                (arglist-cont-nonempty . ++)
                (statement-cont . ++)
                (innamespace . 0))))
(setq c-basic-style "company")
(setq c-basic-offset 4)

(setq ff-other-file-alist
      '(("\\.c" (".h"))
        ("\\.cpp" (".h" ".hpp"))
        ("\\.h" (".cpp" ".c")))
      ff-search-directories
      '("." "../src" "../include" "../../src/*" "../../include/*")
      ff-always-try-to-create nil)

(add-to-list 'load-path "~/.emacs.d/elisp/ggtags")

(setq use-dialog-box nil)

(defun cradcliffe/cmode-hook ()
  (setq indent-tabs-mode nil)
  (c-toggle-electric-state -1)
  (c-set-style "company")
  (setq c-basic-offset 4)
  (subword-mode 1)
  (font-lock-add-keywords nil
      '(("\\<\\(FIXME\\|TODO\\|DEFER\\|BUG\\|NOTE\\):" 1 font-lock-warning-face t)))
  (require 'ggtags)
  (ggtags-mode 1)
  (show-paren-mode 1)
  ;; (require 'gtags)
  ;; (gtags-mode 1)
  (local-set-key (kbd "M-.") 'gtags-find-tag)
  (local-set-key (kbd "M-,") 'gtags-find-rtag)
  (local-set-key (kbd "C-c t") 'ff-find-other-file))

(setq gtags-select-mode-hook
      '(lambda ()
        (local-set-key (kbd "RET") 'gtags-select-tag)))

(add-hook 'c-mode-common-hook 'cradcliffe/cmode-hook)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

(require 'show-wspace)
(add-hook 'c-mode-common-hook 'ws-highlight-trailing-whitespace)
(add-hook 'c-mode-common-hook 'ws-highlight-tabs)
(require 'whitespace)

(provide 'setup-cmode)
