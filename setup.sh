#!/usr/bin/env bash

mkdir -p ~/.elisp
if [ ! -e ~/.elisp/revbufs.el ]; then
    wget http://www.neilvandyke.org/revbufs/revbufs.el
    cp revbufs.el ~/.elisp
fi
if [ ! -e ~/.elisp/yang-mode.el ]; then
    wget http://www.emacswiki.org/emacs/download/yang-mode.el
    cp yang-mode.el ~/.elisp
fi

if [ ! -e ~/.elisp/org-notify.el ]; then
    wget https://raw.githubusercontent.com/p-m/org-notify/master/org-notify.el
    cp org-notify.el ~/.elisp
fi

if [ ! -e ./elisp/private-config.el ]; then
    echo "(provide 'private-config)" > ./elisp/private-config.el
fi

emacs --script ./install.el
