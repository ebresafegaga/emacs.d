
; (setq inhibit-startup-message t)

(require 'package)
(setq
 package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                    ("melpa" . "http://melpa.milkbox.net/packages/")
                    ("melpa-stable" . "http://stable.melpa.org/packages/")))

(package-initialize)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

(scroll-bar-mode -1)
;(menu-bar-mode -1)
;(tool-bar-mode -1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(idris2-interpreter-path "/home/gaga/.idris2/bin/idris2")
 '(package-selected-packages (quote (auto-complete racket-mode haskell-mode))))

(add-to-list 'load-path "~/.emacs.d/idris2-mode/")
(require 'idris2-mode)

(set-face-attribute 'default nil :height 150)
