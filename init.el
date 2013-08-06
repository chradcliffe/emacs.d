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
                  
(require 'setup-ack)
(require 'setup-cmode)
(require 'setup-file-finding)
(require 'setup-package)
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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(org-agenda-files (quote ("~/org/agenda.org")))
 '(uniquify-buffer-name-style (quote post-forward) nil (uniquify)))
