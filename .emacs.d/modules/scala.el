(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/ensime_2.9.2-0.9.8.9/elisp"))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
