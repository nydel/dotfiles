(custom-set-variables
 '(ansi-color-names-vector ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(csv-align-padding 5)
 '(csv-header-lines 5)
 '(custom-enabled-themes (quote (adwaita)))
 '(custom-safe-themes (quote ("5b6a7f2a00275a5589b14fa23ff1699785d9f7c1722ee9f79ec1b7de92fa0935" "8f935a74bc466ff4f6918085781e59e497b26e3f90ec92b660ed90984a818df2" default)))
 '(custom-theme-load-path (quote (t t)))
 '(inhibit-startup-screen t)
 '(require-final-newline nil)
 '(scroll-bar-mode nil)
 '(speedbar-default-position (quote left))
 '(tool-bar-mode nil))

(setq inferior-lisp-program "/usr/bin/sbcl")  
(add-to-list 'load-path "~/bin/slime-2.8/")

(require 'slime)
(slime-setup)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))


(load (expand-file-name "~/quicklisp/slime-helper.el"))                                                                                                                             

(setq slime-enable-evaluate-in-emacs t)

(global-set-key (kbd "C-h y") 'slime-hyperspec-lookup)
(global-set-key (kbd "C-c h") 'html-mode)
(global-set-key (kbd "C-c l") 'lisp-mode)
(global-set-key (kbd "C-c i") 'inferior-lisp)
(global-set-key (kbd "C-c s") 'slime)
(global-set-key (kbd "C-c <down>") 'shrink-window)
(global-set-key (kbd "C-c <up>") 'enlarge-window)

(setq make-backup-files nil)

(setq common-lisp-hyperspec-root "file:/usr/share/doc/hyperspec/")

(defun toggle-fullscreen ()
  "Toggle full screen on X11"
  (interactive)
  (when (eq window-system 'x)
    (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth))))

(global-set-key (kbd "C-c f") 'toggle-fullscreen)

;;resize stuff

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<up>") 'shrink-window)
(global-set-key (kbd "S-C-<down>") 'enlarge-window)
(global-set-key (kbd "C-h M-k RET") 'kill-emacs) ;;hard kill

(custom-set-faces
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

(require 'package)
(setq package-archives '(
			 ;("ELPA" . "http://tromey.com/elpa/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("orgmode" . "http://orgmode.org/elpa/")))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

;; (when (< emacs-major-version 24)
;;  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages")))

(package-initialize)
(column-number-mode)
(setq url-http-attempt-keepalives nil)
