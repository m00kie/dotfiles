(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

(autoload 'ruby-mode "ruby-mode" nil t)

(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq ruby-deep-arglist t)
             (setq ruby-deep-indent-paren nil)))
             ;;(require 'inf-ruby)
             ;;(require 'ruby-compilation)
             ;;(require 'ruby-end)
             ;;(require 'ruby-block)))
