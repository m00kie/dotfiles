;;(load "~/.emacs.d/site-lisp/nxhtml/autostart.el")

(custom-set-variables
 '(nxhtml-default-encoding (quote utf-8))
 '(nxml-child-indent 4)
 '(nxml-slash-auto-complete-flag t)
 '(rng-nxml-auto-validate-flag nil))

(add-hook 'html-mode-hook
          (lambda ()
            (set (make-local-variable 'sgml-basic-offset) 4)))

;;(yas/define-snippets 'nxhtml-mode nil 'html-mode)

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
