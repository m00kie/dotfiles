(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/python-mode.el-6.1.2/"))
(setq py-install-directory (expand-file-name "~/.emacs.d/site-lisp/python-mode.el-6.1.2/"))

;;(add-to-list 'load-path (expand-file-name "~/.emacs.d/site-lisp/virtualenv"))
;;(setq load-path (cons (expand-file-name "~/.emacs.d/site-lisp/pymacs") load-path))

(setq py-install-directory (expand-file-name "v~/.emacs.d/elpa/python-mode-6.0.10"))

;;(autoload 'python-mode "python-mode" "Python Mode." t)
;;(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;;(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(require 'python-mode)
;;(require 'pymacs)

(require 'auto-complete-config)
;;(require 'auto-complete-yasnippet)
;;(require 'auto-complete-python)

(require 'auto-complete)
(global-auto-complete-mode t)
(auto-complete-mode)

;;initialize pymacs
;;(autoload 'pymacs-apply "pymacs")
;;(autoload 'pymacs-call "pymacs")
;;(autoload 'pymacs-eval "pymacs" nil t)
;;(autoload 'pymacs-exec "pymacs" nil t)
;;(autoload 'pymacs-load "pymacs" nil t)

;;initialize rope
;;(pymacs-load "ropemacs" "rope-")
;;(setq ropemacs-enable-autoimport t)

;;auto-complete
;;rope

(defun prefix-list-elements (list prefix)
  (let (value)
    (nreverse
     (dolist (element list value)
       (setq value (cons (format "%s%s" prefix element) value))))))

(defvar ac-source-rope
  '((candidates
     . (lambda ()
         (prefix-list-elements (rope-completions) ac-target))))
  "Source for Rope")

(defun ac-python-find ()
  "Python `ac-find-function'."
  (require 'thingatpt)
  (let ((symbol (car-safe (bounds-of-thing-at-point 'symbol))))
    (if (null symbol)
        (if (string= "." (buffer-substring (- (point) 1) (point)))
            (point)
          nil)
      symbol)))

(defun ac-python-candidate ()
  "Python `ac-candidates-function'"
  (let (candidates)
    (dolist (source ac-sources)
      (if (symbolp source)
          (setq source (symbol-value source)))
      (let* ((ac-limit (or (cdr-safe (assq 'limit source)) ac-limit))
             (requires (cdr-safe (assq 'requires source)))
             cand)
        (if (or (null requires)
                (>= (length ac-target) requires))
            (setq cand
                  (delq nil
                        (mapcar (lambda (candidate)
                                  (propertize candidate 'source source))
                                (funcall (cdr (assq 'candidates source)))))))
        (if (and (> ac-limit 1)
                 (> (length cand) ac-limit))
            (setcdr (nthcdr (1- ac-limit) cand) nil))
        (setq candidates (append candidates cand))))
    (delete-dups candidates)))

(add-hook 'python-mode-hook
          (lambda ()
            (auto-complete-mode 1)
            (local-set-key (kbd "C-<up>") 'py-beginning-of-block)
            (local-set-key (kbd "C-<down>") 'py-end-of-block)))


;;Ryan's python specific tab completion
(defun ryan-python-tab ()
  ;; Try the following:
  ;; 1) Do a yasnippet expansion
  ;; 2) Do a Rope code completion
  ;; 3) Do an indent
  (interactive)
  (if (eql (ac-start) nil)
      (indent-for-tab-command)))

(defadvice ac-start (before advice-turn-on-auto-start activate)
  (set (make-local-variable 'ac-auto-start) t))

(defadvice ac-cleanup (after advice-turn-off-auto-start activate)
  (set (make-local-variable 'ac-auto-start) nil))

;;general python mode
(add-hook 'python-mode-hook
          (lambda ()
            (set-variable 'py-indent-offset 4)
            (set-variable 'py-smart-indentation nil)
            (set-variable 'indent-tabs-mode nil)))

(ac-flyspell-workaround)

;; Auto Syntax Error Hightlight
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (progn
    (add-to-list 'flymake-allowed-file-name-masks
                 '("\\.py\\'" flymake-pyflakes-init))
    (global-set-key "\C-ce" 'flymake-display-err-menu-for-current-line)))

(add-hook 'find-file-hook 'flymake-find-file-hook)

(setq flymake-python-pyflakes-executable "flake8")

;;ipython
;;(require 'ipython)

(setq py-python-command-args '("-colors" "Linux"))
(defadvice py-execute-buffer (around python-keep-focus activate)
  (save-excursion ad-do-it))


(setq virtualenv-workon-home (expand-file-name "~/.envs"))
;;(add-hook 'python-mode-hook 'jedi:setup)
