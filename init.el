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

(setq ring-bell-function 'ignore)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

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
 '(custom-enabled-themes '(doom-gruvbox))
 '(custom-safe-themes
   '("b1a691bb67bd8bd85b76998caf2386c9a7b2ac98a116534071364ed6489b695d" "2ff9ac386eac4dffd77a33e93b0c8236bb376c5a5df62e36d4bfa821d56e4e20" "72ed8b6bffe0bfa8d097810649fd57d2b598deef47c992920aef8b5d9599eefe" "d80952c58cf1b06d936b1392c38230b74ae1a2a6729594770762dc0779ac66b7" "636b135e4b7c86ac41375da39ade929e2bd6439de8901f53f88fde7dd5ac3561" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "2078837f21ac3b0cc84167306fa1058e3199bbd12b6d5b56e3777a4125ff6851" "afa47084cb0beb684281f480aa84dab7c9170b084423c7f87ba755b15f6776ef" "5b9a45080feaedc7820894ebbfe4f8251e13b66654ac4394cb416fef9fdca789" "ddffe74bc4bf2c332c2c3f67f1b8141ee1de8fd6b7be103ade50abb97fe70f0c" "00cec71d41047ebabeb310a325c365d5bc4b7fab0a681a2a108d32fb161b4006" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" "7e068da4ba88162324d9773ec066d93c447c76e9f4ae711ddd0c5d3863489c52" "7ea883b13485f175d3075c72fceab701b5bf76b2076f024da50dff4107d0db25" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "b54376ec363568656d54578d28b95382854f62b74c32077821fdfd604268616a" "3fe1ebb870cc8a28e69763dde7b08c0f6b7e71cc310ffc3394622e5df6e4f0da" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "a9abd706a4183711ffcca0d6da3808ec0f59be0e8336868669dc3b10381afb6f" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "251ed7ecd97af314cd77b07359a09da12dcd97be35e3ab761d4a92d8d8cf9a71" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "b9761a2e568bee658e0ff723dd620d844172943eb5ec4053e2b199c59e0bcc22" "9d29a302302cce971d988eb51bd17c1d2be6cd68305710446f658958c0640f68" "2721b06afaf1769ef63f942bf3e977f208f517b187f2526f0e57c1bd4a000350" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "f053f92735d6d238461da8512b9c071a5ce3b9d972501f7a5e6682a90bf29725" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "991ca4dbb23cab4f45c1463c187ac80de9e6a718edc8640003892a2523cb6259" "1aa4243143f6c9f2a51ff173221f4fd23a1719f4194df6cef8878e75d349613d" "dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "683b3fe1689da78a4e64d3ddfce90f2c19eb2d8ab1bab1738a63d8263119c3f4" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "467dc6fdebcf92f4d3e2a2016145ba15841987c71fbe675dcfe34ac47ffb9195" "4ff1c4d05adad3de88da16bd2e857f8374f26f9063b2d77d38d14686e3868d8d" "f458b92de1f6cf0bdda6bce23433877e94816c3364b821eb4ea9852112f5d7dc" "016f665c0dd5f76f8404124482a0b13a573d17e92ff4eb36a66b409f4d1da410" "49acd691c89118c0768c4fb9a333af33e3d2dca48e6f79787478757071d64e68" "512ce140ea9c1521ccaceaa0e73e2487e2d3826cc9d287275550b47c04072bc4" "bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "680f62b751481cc5b5b44aeab824e5683cf13792c006aeba1c25ce2d89826426" "631c52620e2953e744f2b56d102eae503017047fb43d65ce028e88ef5846ea3b" "2dd4951e967990396142ec54d376cced3f135810b2b69920e77103e0bcedfba9" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7923541211298e4fd1db76c388b1d2cb10f6a5c853c3da9b9c46a02b7f78c882" default))
 '(package-selected-packages
   '(gruvbox-theme doom-themes exec-path-from-shell multiple-cursors flycheck-ocaml merlin-eldoc rg auto-complete dune dune-format helm-gtags ocamlformat utop company lsp-mode rustic nlinum doom-modeline org markdown-mode magit gruber-darker-theme smex merlin tuareg))
 '(safe-local-variable-values
   '((eval add-hook 'prog-mode-hook
	   (lambda nil
	     (whitespace-mode 1))
	   (not :APPEND)
	   :BUFFER-LOCAL)
     (whitespace-style face lines indentation:space)
     (eval let*
	   ((x
	     (dir-locals-find-file default-directory))
	    (this-directory
	     (if
		 (listp x)
		 (car x)
	       (file-name-directory x))))
	   (unless
	       (or
		(featurep 'swift-project-settings)
		(and
		 (fboundp 'tramp-tramp-file-p)
		 (tramp-tramp-file-p this-directory)))
	     (add-to-list 'load-path
			  (concat this-directory "utils")
			  :append)
	     (defvar swift-project-directory)
	     (let
		 ((swift-project-directory this-directory))
	       (require 'swift-project-settings)))
	   (set
	    (make-local-variable 'swift-project-directory)
	    this-directory)))))

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

(global-set-key (kbd "C-x x C-r") 'lsp-find-references)

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
 (add-hook 'tuareg-mode-hook #'utop-minor-mode)
(require 'merlin-eldoc)
(add-hook 'tuareg-mode-hook 'merlin-eldoc-setup)
(add-hook 'tuareg-mode-hook (lambda ()
   (global-set-key (kbd "C-c c f") 'ocamlformat)))
; Make company aware of merlin
(with-eval-after-load 'company
 (add-to-list 'company-backends 'merlin-company-backend))
; Enable company on merlin managed buffers
(add-hook 'merlin-mode-hook 'company-mode)

;; rust stuff
;; (lsp-rust-analyzer-inlay-hints-mode 1)
;; (setq lsp-rust-analyzer-server-display-inlay-hints t)

;; lsp-mode
(setq lsp-headerline-breadcrumb-enable nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq rustic-lsp-server 'rust-analyzer)
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-rust-analyzer-display-parameter-hints t)
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
;; (setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)
