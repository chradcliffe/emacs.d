(require 'color-theme)

;; Hackery for emacs 2.4, which doesn't have plist-to-alist
(defun plist-to-alist (the-plist)
  (defun get-tuple-from-plist (the-plist)
    (when the-plist
      (cons (car the-plist) (cadr the-plist))))

  (let ((alist '()))
    (while the-plist
      (add-to-list 'alist (get-tuple-from-plist the-plist))
      (setq the-plist (cddr the-plist)))
  alist))

(defun cradcliffe-load-theme ()
  (color-theme-hober))

;; Enable theme
;; test for each frame or console
(defun color-theme-for-win-sys (frame)
  (let ((color-theme-is-global nil))
    (select-frame frame)
    (when (window-system frame)
      (cradcliffe-load-theme))))

;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'color-theme-for-win-sys)

;; Start up the color theme in this initial frame.
(let ((color-theme-is-global nil))
  (when (window-system)
    (cradcliffe-load-theme)))

(provide 'setup-theme)
