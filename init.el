(add-to-list 'load-path "~/.elisp")

(add-to-list 'load-path "~/.emacs.d/elisp")

(column-number-mode t)
(setq-default indent-tabs-mode nil)
(setq default-frame-alist
      '((font . "Inconsolata-12")))

(require 'midnight) ;; Clean up buffers
(setq clean-buffer-list-delay-general 1)

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; Turn off menu and tool bars
(menu-bar-mode 0)
(tool-bar-mode 0)

(require 'revbufs) ;; Revert buffers
(require 'newcomment) ;; Comment wrapping in source code

; Calc helper (http://www.emacswiki.org/emacs/AdvancedDeskCalculator)
(defun calc-eval-region (arg beg end)
  "Calculate the region and display the result in the echo area.
With prefix ARG non-nil, insert the result at the end of region."
  (interactive "P\nr")
  (let* ((expr (buffer-substring-no-properties beg end))
         (result (calc-eval expr)))
    (if (null arg)
        (message "%s = %s" expr result)
      (goto-char end)
      (save-excursion
        (insert (concat " = " result))))))

(global-set-key (kbd "C-c c e")
                (lambda ()
                  (interactive)
                  (setq current-prefix-arg '(4))
                  (call-interactively 'calc-eval-region)))

;; Scroll whille preserving column orientation
;; http://www.emacswiki.org/emacs/Scrolling
(defun gcm-scroll-down ()
  (interactive)
  (scroll-up 1))
(defun gcm-scroll-up ()
  (interactive)
  (scroll-down 1))

(global-set-key [(control down)] 'gcm-scroll-down)
(global-set-key [(control up)]   'gcm-scroll-up)

;; Toggle window dedication
;; ref: http://stackoverflow.com/a/65992/77028
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message 
   (if (let (window (get-buffer-window (current-buffer)))
         (set-window-dedicated-p window (not (window-dedicated-p window))))
       "Window '%s' is dedicated"
     "Window '%s' is normal")
   (current-buffer)))

(global-set-key (kbd "S-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-s-<down>") 'shrink-window)
(global-set-key (kbd "S-s-<up>") 'enlarge-window)

(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)


(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail trailing tabs))

(show-paren-mode)

(require 'setup-package)

(require 'setup-ack)
(require 'setup-cmode)
(require 'setup-file-finding)
(require 'setup-perl)
(require 'setup-protobuf)
(require 'setup-python)
(require 'setup-templates)
(require 'setup-theme)

(require 'setup-uniquify)
(require 'setup-vcs)
(require 'setup-yang)
(require 'setup-yaml)
(require 'setup-org-mode)
(require 'setup-twiki)

(require 'edit-server)
(edit-server-start)

(global-unset-key (kbd "C-z"))

(setq company-backends '((company-gtags company-cmake company-dabbrev-code) company-ropemacs company-files company-dabbrev))
(add-hook 'after-init-hook 'global-company-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(clang-format-executable "clang-format-3.4")
 '(clang-format-style "file")
 '(compilation-scroll-output (quote first-error))
 '(custom-safe-themes
   (quote
    ("e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" default)))
 '(gdb-many-windows t)
 '(gdb-non-stop-setting nil)
 '(org-agenda-files (quote ("~/org/agenda.org")))
 '(org-export-backends (quote (ascii html icalendar latex odt)))
 '(projectile-enable-caching t)
 '(projectile-global-mode t)
 '(projectile-use-git-grep t)
 '(pushover-token "a2x76cUitJMARB2vG3VBDExK7ZMskt")
 '(pushover-user-key "upLAKsZjZo7F22sU7G5dFbaynCABBC")
 '(safe-local-variable-values
   (quote
    ((ffip-regexp . ".*\\.\\(cpp\\|py\\|h\\)$")
     (setl ffip-regexp ".*\\.\\(cpp\\|py\\|h\\)$")
     (eval setq default-directory
           (locate-dominating-file buffer-file-name ".dir-locals.el")))))
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(whitespace-line ((t (:background "magenta" :foreground "yellow"))))
 '(whitespace-space ((t (:background "red" :foreground "black")))))
