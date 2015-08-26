
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-backups"))))
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(inhibit-startup-screen t)
 '(package-selected-packages (quote (evil-surround evil-leader)))
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

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backwards-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\M-s" 'isearch-forward-regexp)
(global-set-key "\M-r" 'isearch-backward-regexp)
(global-set-key "\C-m" 'newline-and-indent)
(global-set-key "\C-\\" 'comment-or-uncomment-region)
(global-set-key "\C-x\C-b" 'buffer-menu)

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("marmalade" . "https://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/src/factor/misc/fuel")
(require 'fuel-mode)
(setq fuel-factor-root-dir "~/src/factor")
