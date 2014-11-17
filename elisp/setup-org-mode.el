(defun cradcliffe-insert-redmine (number)
  (interactive "sRedmine number: ")
  (insert (format "[[redmine:%s][#%s]]" number number)))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\C-cd" 'org-time-stamp)
            (local-set-key "\C-cr" 'cradcliffe-insert-redmine)
            (visual-line-mode t)
            (flyspell-mode t)))

(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (plantuml . t)
   (perl . t)
   (sh . t)
   (ditaa . t)))

(setq org-plantuml-jar-path "~/plantuml.jar")

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)

(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")

;; Contains site-specific url function redmine-url
(require 'private-config)

(setq org-link-abbrev-alist
      '(("redmine" . redmine-url)))

(require 'org-notify)
(org-notify-start)

(require 'pushover)

(defun cradcliffe-org-pushover (plist)
  (message "Sending notification!")
  (pushover-notify "Org Notification" 
                   (format "TODO: \"%s\" at %s!"
                           (plist-get plist :heading)
                           (plist-get plist :timestamp))))
(org-notify-add 'default
                '(:time "1h" :actions cradcliffe-org-pushover :period "8h" :duration 90))

(setq org-latex-to-mathml-convert-command
      "java -jar %j -unicode -force -df %o %I"
      org-latex-to-mathml-jar-file
      "/home/MATTER/cradcliffe/local/bin/mathtoweb.jar")

(require 'org-annotate-file)
(require 'outorg)

(provide 'setup-org-mode)
