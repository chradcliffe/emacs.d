(require 'color-theme)
(color-theme-initialize)
;; (require 'sublime-themes)

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

(defun cradcliffe-set-paren-colours ()
  (require 'paren)
  (set-face-background 'show-paren-match "#2B9BF0")
  (set-face-foreground 'show-paren-match "#def")
  (set-face-attribute 'show-paren-match nil :weight 'extra-bold))

(defun cradcliffe-winsys-theme ()
  (color-theme-billw)
  (cradcliffe-set-paren-colours))

(defun cradcliffe-nowin-theme ()
  (cradcliffe-set-paren-colours))

;; Enable theme
;; test for each frame or console
(defun color-theme-select (frame)
  (let ((color-theme-is-global nil))
    (select-frame frame)
    (if (window-system frame)
        (cradcliffe-winsys-theme)
      (cradcliffe-nowin-theme))))

;; hook on after-make-frame-functions
(add-hook 'after-make-frame-functions 'color-theme-select)

;; Start up the color theme in this initial frame.
(let ((color-theme-is-global nil))
  (if (window-system)
      (cradcliffe-winsys-theme)
    (cradcliffe-nowin-theme)))

(provide 'setup-theme)
