(set-cursor-color "white")
(fset 'yes-or-no-p 'y-or-n-p)

(setq ediff-split-window-function 'split-window-horizontally)

(setq default-directory "/Users/mag/dev/")

;;(load-file "~/.emacs.d/site-lisp/cedet-1.0pre7/common/cedet.el")
(setq semanticdb-default-save-directory "~/.emacs-meta/semantic.cache/")
;;(global-ede-mode 1)
;;(semantic-load-enable-code-helpers)
;;(global-srecode-minor-mode 1)
;;(global-linum-mode 1)
(column-number-mode)

;;(require 'ecb)
;;(require 'ecb-autoloads)

(show-paren-mode)
(setq show-paren-style 'expression)

(tool-bar-mode -1)
(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq split-height-threshold 100)

(delete-selection-mode t)
(toggle-truncate-lines)

(put 'narrow-to-page 'disabled nil)

;;(require 'smart-operator)

;(setq exec-path (cons "/home/mag/bin/sml/bin" exec-path))
(setq exec-path (cons "/usr/local/bin" exec-path))
(setq exec-path (cons "/usr/local/share/npm/bin" exec-path))
(setq exec-path (cons "/Users/mag/.cabal/bin" exec-path))
(setq exec-path (cons "/Users/mag/dev/go/bin" exec-path))

(setq user-full-name "Andrey Maksimovich")
(setq user-mail-address "andrey14@gmail.com")

;(setq max-lisp-eval-depth 1000)
(setq max-specpdl-size 2000)
(setq debug-on-error t)

;;
;; ido-mode
;;

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; packages

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

(require 'helm-config)
(helm-mode 1)
(global-set-key (kbd "C-x b") 'helm-mini)

;;(projectile-global-mode)
;;(setq projectile-indexing-method 'native)
;;(setq projectile-enable-caching t)

;;
;; autopair
;;

(require 'autopair)
(setq autopair-autowrap t)
(autopair-global-mode 1)

;;
;;shell
;;
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil 1)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;
;; slime
;;
;(setq inferior-lisp-program "sbcl")

;(require 'slime)
;(require 'slime-autoloads)
;(slime-setup '(slime-fancy))

;;
;; yasnippet
;;

(require 'yasnippet)
(yas-global-mode 1)

;;
;; erlang
;;
(setq erlang-electric-arrow-criteria nil);;'(erlang-stop-when-in-type-spec erlang-next-lines-empty-p erlang-at-end-of-function-p)


;;
;; javascript
;;

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(setq js2-bounce-indent-p nil)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook (lambda () (setq indent-tabs-mode nil)))

(setq exec-path (cons "/usr/local/bin" exec-path))
(setq exec-path (cons "/usr/local/share/npm/bin" exec-path))
(setq exec-path (cons "/Users/mag/.cabal/bin" exec-path))

(setq user-full-name "Andrey Maksimovich")
(setq user-mail-address "andrey14@gmail.com")

;(setq max-lisp-eval-depth 1000)
(setq max-specpdl-size 2000)
(setq debug-on-error t)

;;
;; jsx
;;

(require 'jsx-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(setq jsx-indent-level 4)

(require 'flycheck)
(flycheck-define-checker jsxhint-checker
  "A JSX syntax and style checker based on JSXHint."
  :command ("jsxhint" source)
  :error-patterns
  ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
  :modes (jsx-mode))
(add-hook 'jsx-mode-hook (lambda ()
                           (flycheck-select-checker 'jsxhint-checker)
                           (flycheck-mode)))

;;
;; yaml
;;

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

;;
;; mercurial
;;
;(require 'mercurial)

(require 'ahg)

;;
;; git
;;

(require 'magit)
(define-key global-map "\C-cg" 'magit-status)

;;
;; clojure-mode
;;

(require 'clojure-mode)

;;
;; android
;;

(require 'android-mode)
(defcustom android-mode-sdk-dir "/opt/android" "android-sdk")

;;
;; zencoding
;;

(require 'zencoding-mode)

;;
;; php-mode
;;

(load "php-mode")
(add-to-list 'auto-mode-alist '("\\.php[34]?\\'\\|\\.phtml\\'" . php-mode))
(add-hook 'php-mode-hook 'zencoding-mode)

;;
;; clojure
;;

;; TODO configure cider module

;;
;; io language
;;

(add-to-list 'load-path "~/.emacs.d/site-lisp/io-mode")
(require 'io-mode)

;;
;; haskell
;;

(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

;;(add-to-list 'auto-mode-alist '("\\.elm\\'" . haskell-mode))

;;
;; org-mode
;;

(require 'org-install)
(add-to-list 'Info-default-directory-list (expand-file-name "~/.emacs.d/site-lisp/org-mode/info"))
(setq org-agenda-files (list "~/org/home.org" "~/org/todo.org"))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(require 'elp)

(require 'less-css-mode)

;; key bindings
(global-set-key "\C-\M-o" (lambda () (interactive) (progn (move-end-of-line 1) (newline-and-indent))))
(global-set-key "\C-chgb" (lambda () (interactive) (ahg-do-command "branch")))
(global-set-key "\C-chgp" (lambda () (interactive) (ahg-do-command "push")))
(global-set-key "\C-chga" (lambda () (interactive) (vc-annotate (buffer-file-name))))

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c #") 'comment-region)
(global-set-key (kbd "C-x #") 'uncomment-region)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-c j") 'just-one-space)
(global-set-key (kbd "C-c i") 'indent-region)

;;(load-theme 'joost)

(put 'dired-find-alternate-file 'disabled nil)

(load-file "~/.emacs.d/modules/python.el")
(load-file "~/.emacs.d/modules/html.el")
(load-file "~/.emacs.d/modules/ruby.el")
(load-file "~/.emacs.d/modules/scala.el")
(load-file "~/.emacs.d/modules/javascript.el")

;; multiple-cursors

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; rust-mode

(add-to-list 'load-path "/Users/mag/.emacs.d/site-lisp/rust-mode")
(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; go-mode

(require 'go-autocomplete)
(require 'auto-complete-config)

(ac-config-default)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(defun my-go-mode-hook ()
  (add-hook 'before-save-hook 'gofmt-before-save)
  (local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'my-go-mode-hook)
