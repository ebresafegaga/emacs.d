
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

;; ocaml stuff
(setq merlin-use-auto-complete-mode t)
(setq merlin-ac-setup t)
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line

(face-spec-set
 'tuareg-font-lock-constructor-face
 '((((class color) (background light)) (:foreground "DarkSlateGray"))
   (((class color) (background dark)) (:foreground "burlywood1"))))

(face-spec-set
 'tuareg-font-lock-module-face
 '((((class color) (background light)) (:foreground "brown4"))
   (((class color) (background dark)) (:foreground "burlywood1"))))
