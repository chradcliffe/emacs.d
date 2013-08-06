(ido-mode)
(require 'recentf)
(setq recentf-max-saved-items 50)
(recentf-mode t)
(setq ido-enable-flex-matching t
      ido-case-fold t
      ido-use-virtual-buffers t
      ido-file-extension-order '(".cpp" ".h" ".py" ".yang"))

;; http://www.masteringemacs.org/articles/2011/01/27/find-files-faster-recent-files-package/
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(provide 'setup-file-finding)
