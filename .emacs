(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "ec5f697561eaf87b1d3b087dd28e61a2fc9860e4c862ea8e6b0b77bd4967d0ba" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))
 '(package-selected-packages
   '(racer yaml-mode cargo rust-mode eyebrowse window-number company gruvbox-theme color-theme-sanityinc-tomorrow spacemacs-theme badger-theme monokai-theme zenburn-theme aggressive-indent rainbow-delimiters evil-paredit projectile paredit clojure-mode-extra-font-locking cider solarized-theme evil ##))
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

;; MELPA setup
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; EVIL
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map "q" nil)

;; Menu bar cleanup
(menu-bar-mode -1)
(load-theme 'sanityinc-tomorrow-night)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; Clojure-mode
(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

;; Projectile file search
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Paredit hooks
(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       #'enable-paredit-mode)
(add-hook 'eval-expression-minibuffer-setup-hook #'enable-paredit-mode)
(add-hook 'ielm-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-mode-hook             #'enable-paredit-mode)
(add-hook 'lisp-interaction-mode-hook #'enable-paredit-mode)
(add-hook 'scheme-mode-hook           #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'enable-paredit-mode)
(add-hook 'clojure-mode-hook #'evil-paredit-mode)

;; Delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Aggro indent
(add-hook 'clojure-mode-hook 'aggressive-indent-mode)

;; Font locking
(require 'clojure-mode-extra-font-locking)

;; Line highlight
(global-hl-line-mode +1)

;; Extra exec for OSX
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/.cargo/bin")

;; Windowing
(require 'window-number)
(window-number-mode 1)

;; TMUX style windows
(eyebrowse-mode t)
(global-set-key (kbd "C-q") 'window-number-switch)

;; Parens
(show-paren-mode 1)

;; Line numbers
(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;; Rust
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook 'cargo-minor-mode)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(require 'rust-mode)
(setq company-tooltip-align-annotations t)
(setq company-idle-delay 1)
(setq company-minimum-prefix-length 2)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "TAB") #'company-select-next)
  (define-key company-active-map [tab] #'company-select-next)
  (define-key company-active-map (kbd "BACKTAB") #'company-select-previous)
  (define-key company-active-map [backtab] #'company-select-previous))

;; Window split swap
(defun toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

(global-set-key (kbd "C-x |") 'toggle-frame-split)

;; YAML
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; WINNER!
(winner-mode)

;; ENV
(setenv "GOOGLE_APPLICATION_CREDENTIALS" "/home/tetigi/opt/google/gcloud-service-key.json")

;; AUTO-COMPLETE
(add-hook 'cider-repl-mode-hook #'company-mode)
(add-hook 'cider-mode-hook #'company-mode)
(add-hook 'cider-repl-mode-hook #'cider-company-enable-fuzzy-completion)
(add-hook 'cider-mode-hook #'cider-company-enable-fuzzy-completion)

;; FONT
(set-face-attribute 'default nil :font "Ubuntu Mono-12")
(set-frame-font "Ubuntu Mono-12" nil t)
