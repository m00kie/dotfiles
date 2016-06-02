(load-file "~/.emacs.d/init.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(fold-dwim-mode t)
 '(indent-tabs-mode nil)
 '(js2-enter-indents-newline t)
 '(nxhtml-default-encoding (quote utf-8))
 '(nxml-child-indent 4)
 '(nxml-slash-auto-complete-flag t)
 '(rng-nxml-auto-validate-flag nil)
 '(ruby-indent-level 2)
 '(safe-local-variable-values
   (quote
    ((setq jedi:server-args
           (quote
            ("--virtual-env" "/Users/mag/.envs/pd")))
     (virtualenv-default-directory . "/Users/mag/.envs/pd")
     (virtualenv-workon . "pd")
     (virtualenv-default-directory . "/Users/mag/.envs/qr")
     (virtualenv-workon . "qr")
     (virtualenv-default-directory . "/Users/mag/.envs/pdf")
     (virtualenv-workon . "pdf-service")
     (pony-settings make-pony-project :python "/home/mag/.envs/qr/bin/python" :settings "settings")
     (pony-settings make-pony-project :python "/home/mag/dev/codingstaff/quoteroller/tip/.env/bin/python" :settings "settings_local")
     (pony-settings make-pony-project :python "/home/mag/dev/codingstaff/seedbox/tip/.env/bin/python" :settings "settings")
     (pony-settings make-pony-project :python "/home/mag/dev/codingstaff/seedbox/tip/.env/bin/python" :settings "settings_local")
     (encoding . utf-8)
     (pony-settings make-pony-project :python "/home/mag/dev/codingstaff/quoteroller/tip/.env/bin/python" :settings "settings")
     (ruby-compilation-executable . "ruby")
     (ruby-compilation-executable . "ruby1.8")
     (ruby-compilation-executable . "ruby1.9")
     (ruby-compilation-executable . "rbx")
     (ruby-compilation-executable . "jruby"))))
 '(scroll-bar-mode nil)
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(show-trailing-whitespace t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(virtualenv-root "~/dev/codingstaff/quoteroller/pdf-service/.env"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "unknown" :family "Anonymous Pro"))))
 '(eruby-comment-face ((t (:foreground "gray"))))
 '(eruby-standard-face ((t (:foreground "dark cyan"))))
 '(mumamo-background-chunk-major ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode1 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode2 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode3 ((((class color) (min-colors 88) (background dark)) nil)))
 '(mumamo-background-chunk-submode4 ((((class color) (min-colors 88) (background dark)) nil))))
(put 'upcase-region 'disabled nil)
