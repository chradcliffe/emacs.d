(ido-mode)
(require 'recentf)
(setq recentf-max-saved-items 100)
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

(require 'smex)
(smex-initialize)
(global-set-key [(meta x)] 'smex)
(global-set-key [(shift meta x)] 'smex-major-mode-commands)
(global-set-key [(super f)] 'find-file-in-project)

(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)))

(require 'projectile)
(projectile-global-mode)

(defcustom git-grep-switches "--extended-regexp -I -n --ignore-case --no-color"
  "Switches to pass to `git grep'."
  :type 'string)
 
(defcustom git-grep-default-work-tree (expand-file-name "~/git/sw/sw/trunk")
  "Top of your favorite git working tree.  \\[git-grep] will search from here if it cannot figure out where else to look."
  :type 'directory
  )
 
(setq grep-files-aliases '(("everything" . "*")))

(defalias 'git-grep 'vc-git-grep)

(global-set-key (kbd "C-x g g") 'git-grep)

(provide 'setup-file-finding)
