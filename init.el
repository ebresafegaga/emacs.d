(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
;; ocaml tuareg mode
;; ocaml merlin mode
;; org mode
;; racket mode

(setq inhibit-startup-message t
      inhibit-startup-echo-message t)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(setq next-line-add-newlines t)
;; (global-hl-line-mode 1)
;; (doom-modeline-mode -1)

;; (set-frame-font 18)

; recent files 
;(require 'recentf)
; (global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
;; (recentf-mode t)

; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;(recentf-mode 1)
;(setq recentf-max-menu-items 25)
;(setq recentf-max-saved-items 25)
;(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;(require 'haskell-interactive-mode)
;;(require 'haskell-process)
;;(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; (add-hook 'after-init-hook 'global-company-mode)

;; racket-mode
(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)

;(set-default-font "DejaVu Sans Mono")
; (set-default-font "Ubuntu Mono-18")

;(require 'doom-modeline)
;(doom-modeline-mode 1)


(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; relative line numbers
(setq display-line-numbers 'relative)

;; need to highlight this thing
;; (nlinum-mode 1)
;; (setq nlinum-highlight-current-line t)

(scroll-bar-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(column-number-mode 1)
; (show-paren-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("7923541211298e4fd1db76c388b1d2cb10f6a5c853c3da9b9c46a02b7f78c882" default))
 '(package-selected-packages
   '(nlinum doom-modeline org markdown-mode magit gruber-darker-theme smex merlin tuareg)))

;;(add-to-list 'load-path "~/.emacs.d/idris2-mode/")
;;(require 'idris2-mode)

(set-face-attribute 'default nil :height 150 :family "Ubuntu Mono")

(global-set-key (kbd "C-x C-b") 'ibuffer)
;; (setq-default frame-title-format '("%f")) 

;; ocaml stuff
(setq merlin-use-auto-complete-mode t)
(setq merlin-ac-setup t)
(add-hook 'tuareg-mode-hook #'merlin-mode)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
