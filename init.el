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

;; (rectangle-mark-mode 1)

(setq next-line-add-newlines t)
;; (global-hl-line-mode 1)
;; (doom-modeline-mode -1)

;; (set-frame-font 18)

; recent files 
;(require 'recentf)
; (global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; enable recent files mode.
;; (recentf-mode t)

(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(recentf-mode 1)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; (add-hook 'after-init-hook 'global-company-mode)

(when (version<= "26.0.50" emacs-version)
  (global-display-line-numbers-mode))

;; relative line numbers
(setq display-line-numbers-type 'relative)

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
   '(multiple-cursors flycheck-ocaml merlin-eldoc rg auto-complete dune dune-format helm-gtags ocamlformat utop company lsp-mode rustic nlinum doom-modeline org markdown-mode magit gruber-darker-theme smex merlin tuareg)))

(set-face-attribute 'default nil :height 150 :family "Ubuntu Mono")

;; highlight the line
;; (global-hl-line-mode 0)

(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "C-c c l") 'flycheck-list-errors)

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(setq eldoc-echo-area-use-multiline-p t)

;; ocaml stuff
(global-set-key (kbd "C-c m p") 'merlin-eldoc-jump-to-prev-occurrence)
(global-set-key (kbd "C-c m n") 'merlin-eldoc-jump-to-next-occurrence)
(setq merlin-eldoc-max-lines 10)
;; don't dedicate a line to the documentation
(setq merlin-eldoc-max-lines-doc 'fit)
(setq merlin-use-auto-complete-mode t)
(setq merlin-ac-setup t)
(setq merlin-ac-setup 'easy)
(with-eval-after-load 'merlin
  ;; Disable Merlin's own error checking
  (setq merlin-error-after-save nil)
  ;; Enable Flycheck checker
  (flycheck-ocaml-setup))
(add-hook 'tuareg-mode-hook #'flycheck-mode)
(add-hook 'tuareg-mode-hook #'merlin-mode)
(require 'merlin-eldoc)
(add-hook 'tuareg-mode-hook 'merlin-eldoc-setup)
; Make company aware of merlin
(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)

;; rust stuff
(lsp-rust-analyzer-inlay-hints-mode 1)
(setq lsp-rust-analyzer-server-display-inlay-hints t)

;; lsp-mode
(setq lsp-headerline-breadcrumb-enable nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
