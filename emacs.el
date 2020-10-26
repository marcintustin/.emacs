
;; .emacs
;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;;;; Note below warning is the default text. We set customizations in this file to prevent separate customization being loaded
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

; alt/option on right as super
(setq ns-right-option-modifier 'super)
 (setq ns-alternate-modifier 'meta)

;;(require 'un-define)
;(set-coding-priority-list '(utf-8))
;(set-coding-category-system 'utf-8 'utf-8)

;(set-default-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8)
;; From Emacs wiki
;(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; MS Windows clipboard is UTF-16LE 
;(set-clipboard-coding-system 'utf-16le-dos)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
 (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
     (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)


;;; Marcin Tustin's init.el/emacs.el - modified for bb use 10/10/2006

;;; Colorized fonts
(require 'font-lock)
(setq font-lock-maximum-decoration t)
(font-lock-mode 1)

;; show the line and column number
(line-number-mode t)
(column-number-mode t)

;; For some reason login.ecs.soton.ac.uk doesn't like this next line
;(paren-activate)
(show-paren-mode 1)


;(defun up-slightly () (interactive) (scroll-up 5))
;(defun down-slightly () (interactive) (scroll-down 5))
;(global-set-key [mouse-4] 'down-slightly)
;(global-set-key [mouse-5] 'up-slightly)

;(defun up-one () (interactive) (scroll-up 1))
;(defun down-one () (interactive) (scroll-down 1))
;(global-set-key [S-mouse-4] 'down-one)
;(global-set-key [S-mouse-5] 'up-one)

;(defun up-a-lot () (interactive) (scroll-up))
;(defun down-a-lot () (interactive) (scroll-down))
;(global-set-key [(control mouse-4)] 'down-a-lot)
;(global-set-key [C-mouse-5] 'up-a-lot)

(global-set-key [mouse-3]
  `(menu-item ,(purecopy "Menu Bar") ignore
    :filter (lambda (_)
              (if (zerop (or (frame-parameter nil 'menu-bar-lines) 0))
                  (mouse-menu-bar-map)
                (mouse-menu-major-mode-map)))))

(global-set-key [(control <)] 'beginning-of-buffer)
(global-set-key [(insert)] 'clipboard-kill-ring-save)
(global-set-key [(meta w)] 'clipboard-kill-ring-save)
(global-set-key [(meta w)] 'clipboard-kill-ring-save)


(global-set-key "\C-w" 'clipboard-kill-region)
(global-set-key "\M-w" 'clipboard-kill-ring-save)
(global-set-key "\C-y" 'yank)


(global-set-key [(f11)] 'hippie-expand)


(global-set-key [(f3)] 'buffer-menu)
(global-set-key [(f12)] 'replace-regexp)
(global-set-key [(meta g)] 'goto-line)
(global-set-key [(meta r)] 'revert-buffer)
(global-set-key [(control n)] 'new-frame)
(global-set-key [(control r)] 'eval-region)


(global-set-key [(control \\)] 'set-mark-command)
(global-set-key [(button5)] 'scroll-up)
(global-set-key [(button4)] 'scroll-down)
(global-set-key [(super up)] 'previous-logical-line)


(global-set-key [(control delete)] 'kill-this-buffer)
(global-set-key [(meta delete)] 'delete-window)
(global-set-key [(insert)] 'copy-region-as-kill)

(global-set-key [(control x) \?] 'register-to-point)
(global-set-key [(control l)] 'bury-buffer)


(setq delete-key-deletes-forward 'true)


(defun dos2unix ()
  "Cut all visible ^M."
  (interactive)
  (beginning-of-buffer)
  (while (search-forward "\r" nil t)
   (replace-match "" nil t))
)

(defun fixit ()
  "Cut all visible ^M."
  (interactive)
  (beginning-of-buffer)
  (while (search-forward "\r" nil t)
   (replace-match "\n" nil t))
)

(defun sort-comma-list ()
  "Sort comma separated items in region"
  (interactive)
  (sort-regexp-fields nil "[^,]+" "\\&" (region-beginning) (region-end)))

(defun squeeze-blank-lines ()(interactive) (replace-regexp "^[ 	]*
" ""))

(defun squeeze-duplicates ()(interactive) (replace-regexp "\(^.*$\)
\1" "\1"))

(defun json-stuff () (interactive)
       (progn
         (while (re-search-forward "\n" (region-end) t)
           (replace-match "" nil nil))
         (while (re-search-forward "\"" (region-end) t)
           (replace-match "\\\\\"" nil nil))))


; My .emacs file.  Hacked together from a lot of others.

(setq-default indent-tabs-mode nil)
(setq frame-title-format "Emacs - %f")
(setq icon-title-format "Emacs - %f")
(setq query-replace-highlight t)    ;highlight during query
(setq search-highlight t)        ;incremental search highlights

;; I like to know what time it is. These lines show the clock in
;; the status bar. Comment out first line if you prefer to show
;; time in 12 hour format
(setq display-time-24hr-format t)
;; To indulge login.ecs.soton.ac.uk this was disabled
;; also because it crowds out line/column display
;(display-time)

;; Get rid of that anoying text at the start of the scratch buffer
(setq initial-scratch-message nil)

;;; Resize the minibuffer so its entire contents are visible.
(setq resize-minibuffer-mode t)
;; For the indulgence of login.ecs this was disabled
;(resize-minibuffer-mode)


;(add-to-list 'load-path (expand-file-name "~/.emacs.d/"))



;;;Colours
(set-face-background 'default      "gray85")
(set-face-foreground 'default      "black")


(setq c-default-style "bsd")
(setq c-basic-offset 4)
(setq c-font-lock-extra-types (list "gboolean" "gsize" "gssize"
                                   "gchar" "guchar"
                                   "gint" "gint8" "gint16" "gint32"
                                   "guint" "guint8" "guint16" "guint32"
                                   "gshort" "gushort" "glong" "gulong"
                                   "gfloat" "gdouble" "gpointer"
                                   "gconstpointer"
                   "GList" "GSList" "GFunc" "GString" ))

;(add-to-list 'auto-mode-alist '("\\.gob$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . fortran-mode))
(add-to-list 'auto-mode-alist '("\\.xml$" . nxml-mode))
;;(add-to-list 'auto-mode-alist '("\\.gobxml$" . nxml-mode))
(add-to-list 'auto-mode-alist '("\\.ini$" . ini-mode))
(add-to-list 'auto-mode-alist '("\\.fix$" . fix-mode))
(emacs-version)

(if (string-match "Aquamacs.*" (emacs-version)) '(one-buffer-one-frame-mode nil nil (aquamacs-frame-setup)))
; this is the cause of the c-emacs-features error
;;(require 'css-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 312 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(column-number-mode t)
 '(custom-file nil)
 '(nil nil t)
 '(ns-right-alternate-modifier 'super)
 '(ns-tool-bar-display-mode 'both t)
 '(ns-tool-bar-size-mode 'regular t)
 '(package-selected-packages
   '(elpy sed-mode groovy-mode gradle-mode scala-mode go-mode company-jedi jedi jedi-core company-ansible tickscript-mode dockerfile-mode docker-compose-mode magit mmm-jinja2 ansible yaml-mode flycheck-pony flycheck ponylang-mode tabbar editorconfig use-package))
 '(show-paren-mode t)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "gray85" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "monotype" :family "Andale Mono"))))
 '(text-mode-default ((t (:inherit 'default)))))


(setq js-indent-level 2)

(add-hook 'java-mode-hook (lambda ()
                            (setq c-basic-offset 2
                                  indent-tabs-mode 'nil)))

(require 'make-mode)
(add-hook 'makefile-gmake-mode-hook #'auto-complete-mode)



(require 'package)
;; needed because paths with spaces break jedi
(setq package-user-dir "~/.emacs.d/packages")
(progn
 (defvar warning-minimum-level :emergency)
 (package-initialize))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ;;("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))


(package-install 'use-package)
(require 'use-package)
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(package-initialize)
(use-package json
  :ensure t)

(use-package tabbar
  :ensure t
  :config
  (tabbar-mode 't))

(use-package auto-complete
  :ensure t
  :disabled
  :config
  (require 'auto-complete-config)
  (global-auto-complete-mode 't))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(setq ns-right-option-modifier 'super)


(use-package ponylang-mode
  :ensure t
  :config
  (add-hook
   'ponylang-mode-hook
   (lambda ()
     (set-variable 'indent-tabs-mode nil)
     (set-variable 'tab-width 2)))
)
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode)
)
(use-package flycheck-pony
  :ensure t)

(use-package org
  :ensure t
  :config
  (setq org-log-done 'time)
  (setq org-agenda-files (list "~/Documents/TODO.org")))

(use-package yaml-mode
  :ensure t
  :hook (yaml-mode . turn-off-auto-fill))

(use-package ansible
  :ensure t
  :hook (yaml-mode . ansible))

(use-package mmm-jinja2 :ensure t)

;; TODO: Configure this so that when the commit message window is closed using the provided commands,
;; the magit-diff buffer that was opened is also deleted. This *should* ensure that we get a fresh diff
;; every time
(use-package git-commit :ensure t)

(use-package magit :ensure t)

(use-package docker-compose-mode :ensure t)

(use-package dockerfile-mode :ensure t)

(use-package tickscript-mode :ensure t)

(use-package company-ansible
  :ensure t
  :after (company)
  :hook (yaml-mode . (lambda () (company-mode)))
  :config
  (add-to-list 'company-backends 'company-ansible)
  (setq company-idle-delay 0))

;(setq python-check-command "/usr/local/bin/flake8")

(use-package elpy
  :ensure t
  :defer t
  :custom
  (python-check-command "/usr/local/bin/flake8")
  (elpy-syntax-check-command  "/usr/local/bin/flake8")
  :init
  (setq python-shell-interpreter "/usr/local/bin/python3")
  (setenv "VIRTUALENVWRAPPER_PYTHON" python-shell-interpreter)
  (setenv "WORKON_HOME" (concat (getenv "HOME") "/dev/venvs/"))
  (advice-add 'python-mode :before 'elpy-enable)
  )

;; (use-package jedi-core
;;   :ensure t
;;   :config
;;   (setq python-environment-directory "~/.emacs.d/.python-environments")
;;   (setq jedi:complete-on-dot t)
;;   (jedi:install-server))

;; (use-package jedi
;;   :ensure t
;;   :after (jedi-core)
;;   :hook (python-mode . jedi:setup)
;;   :config
;;   (setq jedi:get-in-function-call-delay 500))

;; (use-package company-jedi :ensure t)
;; ;; server setup
;; (setq server-socket-dir "~/.emacs.d/server-sockets")
;; (server-start)

;; (setq flycheck-python-pycompile-executable "python3")

(use-package go-mode
  :ensure t)

(use-package scala-mode
  :ensure t
  :interpreter
  ("amm" . scala-mode))


(use-package gradle-mode
  :ensure t)


(use-package groovy-mode
  :ensure t)

(use-package sed-mode
  :ensure t)

;; Keep the path settings of the remote account.
(use-package tramp
  :config
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
  (setq vc-handled-backends '(Git))
  (setq tramp-verbose 1)
  (customize-set-variable
      'tramp-backup-directory-alist (cons tramp-file-name-regexp "~/.emacs.d/backups/"))
  ;; TRAMP gcloud ssh
  (add-to-list 'tramp-methods
  '("gssh"
    (tramp-login-program        "gcloud compute ssh")
    (tramp-login-args           (("%h")))
    (tramp-async-args           (("-q")))
    (tramp-remote-shell         "/bin/sh")
    (tramp-remote-shell-args    ("-c"))
    (tramp-gw-args              (("-o" "GlobalKnownHostsFile=/dev/null")
                                 ("-o" "UserKnownHostsFile=/dev/null")
                                 ("-o" "StrictHostKeyChecking=no")
                                 ("--internal-ip")))
    (tramp-default-port         22)))
)
