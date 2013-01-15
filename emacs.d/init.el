(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-backups"))))
 '(eshell-cmpl-file-ignore "~\\'\\|.*\\(\\.pyo\\|\\.pyc\\)")
 '(global-auto-revert-mode t)
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(inhibit-startup-screen t)
 '(require-final-newline t)
 '(server-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(el-get 'sync)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backwards-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-\\" 'comment-or-uncomment-region)
(global-set-key "\C-x\C-b" 'buffer-menu)

(fset 'yes-or-no-p 'y-or-n-p)

(setq load-path
      (append load-path
              '("~/.emacs.d")))

(load-theme 'wombat t)

;; Python
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py$" flymake-pyflakes-init)))
(add-hook 'python-mode-hook
          (lambda ()
            (setq show-trailing-whitespace)
            (if (not (eq buffer-file-name nil))
                (progn
                  (flymake-mode t)
                  (local-set-key "\M-n" 'flymake-goto-next-error)
                  (local-set-key "\M-p" 'flymake-goto-prev-error)))))
(load-file "~/.emacs.d/flymake-cursor.el")

(require 'powershell-mode)

(require 'midnight)
(midnight-delay-set 'midnight-delay "4:30am")

;; And finally, the default startup code
(defun maximize-frame ()
  "Maximizes the active frame in Windows"
  (interactive)
  ;; Send a `WM_SYSCOMMAND' message to the active frame with the
  ;; `SC_MAXIMIZE' parameter.
  (when (eq system-type 'windows-nt)
    (w32-send-sys-command 61488)))
(add-hook 'window-setup-hook 'maximize-frame t)
(defun setup-default-windows ()
  "Divides the frame into six windows and launches eshell"
  (interactive)
  (split-window-vertically)
  (split-window-horizontally)
  (other-window 2)
  (split-window-horizontally)
  (balance-windows)
  (other-window 2)
  (eshell))
(defun setup-everything ()
  (maximize-frame)
  (setup-default-windows))
(add-hook 'window-setup-hook 'setup-everything t)
