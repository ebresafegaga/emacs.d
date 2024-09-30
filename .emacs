(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; I don't want the bell sound
(setq ring-bell-function 'ignore)

;; Maybe I should be using https://github.com/jwiegley/use-package

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; Disable electric indent mode (which is enabled by default)
(electric-indent-mode)

;; Highlight Indentation
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)

(global-display-line-numbers-mode t)
(setq column-number-mode t)

;; Smooth scrolling
(pixel-scroll-precision-mode 1)
;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time 
;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling 
;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse 
;; (setq scroll-step 1) ;; keyboard scroll one line at a time
;; (setq scroll-conservatively most-positive-fixnum)

;; Still need to find a way to do this globally.. or not?
;; (toggle-truncate-lines)

;; Get access to shell environment
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Font configuration
(set-face-attribute 'default nil :height 180)

;; "Interactively do things"
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)  

;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Company
(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)

;; Flycheck
(global-set-key (kbd "C-c c l") 'flycheck-list-errors)

;; Coq 
;; load company-coq when opening Coq files
;; (add-hook 'coq-mode-hook #'company-coq-mode)

;; OCaml
(add-hook 'tuareg-mode-hook #'merlin-mode t)
(add-hook 'caml-mode-hook #'merlin-mode t)
(add-hook 'tuareg-mode-hook #'flycheck-mode t)
(global-set-key (kbd "C-c m p") 'merlin-eldoc-jump-to-prev-occurrence)
(global-set-key (kbd "C-c m n") 'merlin-eldoc-jump-to-next-occurrence)
(setq merlin-eldoc-max-lines 10)
;; don't dedicate a line to the documentation
(setq merlin-eldoc-max-lines-doc 'fit)
(setq merlin-use-auto-complete-mode t)
(setq merlin-ac-setup t)
(setq merlin-ac-setup 'easy)
;; use opam to locate `ocamlmerlin` command.
(setq merlin-command 'opam)
(require 'merlin-eldoc)
(add-hook 'tuareg-mode-hook 'merlin-eldoc-setup)
(with-eval-after-load 'merlin
  ;; disable Merlin's own error checking
  (setq merlin-error-after-save nil)
  ;; enable Flycheck checker
  (flycheck-ocaml-setup))
(add-hook 'tuareg-mode-hook #'flycheck-mode t)
(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
;; enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)
(add-to-list 'auto-mode-alist '("\\.mlg$" . tuareg-mode) t)
;; still need to figure this out
(add-hook 'tuareg-mode-hook (lambda ()
  (global-set-key (kbd "C-c c f") 'ocamlformat)))

;; LSP mode
(setq lsp-headerline-breadcrumb-enable nil)

;; Rust
(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-rust-analyzer-display-parameter-hints t)
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
;; (setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))
(global-set-key (kbd "C-x |") 'toggle-window-split)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-mode rustic highlight-indent-guides rg multiple-cursors nix-mode company-coq magit company flycheck-ocaml merlin-eldoc ocamlformat dune utop merlin exec-path-from-shell proof-general tuareg)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
