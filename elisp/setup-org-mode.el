(defun cradcliffe-insert-redmine (number)
  (interactive "sRedmine number: ")
  (insert (format "[[redmine:%s][#%s]]" number number)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\C-cd" 'org-time-stamp)
            (local-set-key "\C-cr" 'cradcliffe-insert-redmine)
            (visual-line-mode t)))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (plantuml . t)
   (perl . t)
   (sh . t)))

(setq org-plantuml-jar-path "~/plantuml.jar")

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; Contains site-specific url function redmine-url
(load "~/.emacs.d/elisp/redmine-url.el")

(setq org-link-abbrev-alist
      '(("redmine" . redmine-url)))

(provide 'setup-org-mode)
