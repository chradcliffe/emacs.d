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

;; BEGIN enum class fix
;; (http://stackoverflow.com/questions/6497374/emacs-cc-mode-indentation-problem-with-c0x-enum-class)
(defun inside-class-enum-p (pos)
  "Checks if POS is within the braces of a C++ \"enum class\"."
  (ignore-errors
    (save-excursion
      (goto-char pos)
      (up-list -1)
      (backward-sexp 1)
      (looking-back "enum[ \t]+class[ \t]+[^}]+"))))

(defun align-enum-class (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      0
    (c-lineup-topmost-intro-cont langelem)))

(defun align-enum-class-closing-brace (langelem)
  (if (inside-class-enum-p (c-langelem-pos langelem))
      '-
    '+))

(defun fix-enum-class ()
  "Setup `c++-mode' to better handle \"class enum\"."
  (add-to-list 'c-offsets-alist '(topmost-intro-cont . align-enum-class))
  (add-to-list 'c-offsets-alist
               '(statement-cont . align-enum-class-closing-brace)))

(add-hook 'c++-mode-hook 'fix-enum-class)
;; END enum class fix

(require 'yasnippet)

(when (require 'auto-complete-config nil 'noerror)
    (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
    (global-auto-complete-mode t))

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
  (whitespace-mode t)
  (local-set-key (kbd "M-.") 'gtags-find-tag)
  (local-set-key (kbd "M-,") 'gtags-find-rtag)
  (local-set-key (kbd "C-c t") 'ff-find-other-file))

(setq gtags-select-mode-hook
      '(lambda ()
        (local-set-key (kbd "RET") 'gtags-select-tag)))

(add-hook 'c-mode-common-hook 'cradcliffe/cmode-hook)
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; (require 'show-wspace)
;; (add-hook 'c-mode-common-hook 'ws-highlight-trailing-whitespace)
;; (add-hook 'c-mode-common-hook 'ws-highlight-tabs)

(provide 'setup-cmode)
