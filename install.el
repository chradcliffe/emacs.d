(require 'package)
(add-to-list 'package-archives 
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(defun install-if-not-installed (package)
  (if (package-installed-p package)
      nil
    (package-install package)))

(mapc 'install-if-not-installed
      '(yasnippet
        smex
        projectile
        protobuf-mode
        highlight-indentation
        color-theme
        dsvn
        yaml-mode
        edit-server))

