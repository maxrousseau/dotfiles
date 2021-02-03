;; emacs config
;; Maxime Rousseau
;;
;; Package Setup
;; ------------------------------------------------------------
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
  ;; and `package-pinned-packages`. Most users will not need or want to do this.
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  )
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(setq package-check-signature 'allow-unsigned)

;; now for use-package
(add-to-list 'load-path "~/.emacs.d/site-lisp/use-package")
(require 'use-package)

(with-eval-after-load 'info
  (info-initialize)
  (add-to-list 'Info-directory-list
               "~/.emacs.d/site-lisp/use-package/"))

;; Appearance
;; ------------------------------------------------------------
;; best themes 
(use-package base16-theme
  :ensure t
  :config
  (load-theme 'base16-dracula t))

;; This status line is not great, improve on clarity of information displayed.
(display-time-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; disable all GUI bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; dope bitmap font
(set-frame-font "Spleen 32x64 12" nil t)

;; does not display line numbers by default
;; toggle with keybinding C-= l
(global-linum-mode 1)
(global-set-key (kbd "C-; l") 'global-linum-mode)

;; on startup -> currently nothing goes to scratch
;; TODO make improvements to this
(setq inhibit-startup-screen t)

;; Backup
;; ------------------------------------------------------------
;; Place backup files in a specific folder, this was copy-pasted...
;; Should be rewritten and customized
;;Put backup files neatly away
(let ((backup-dir "~/.emacs.d/Emacs/backups")
      (auto-saves-dir "~/.emacs.d/Emacs/autosavedir/")
      )
  (dolist (dir (list backup-dir auto-saves-dir))
    (when (not (file-directory-p dir))
      (make-directory dir t)))
  (setq backup-directory-alist `(("." . ,backup-dir))
        auto-save-file-name-transforms `((".*" ,auto-saves-dir))
        auto-save-list-file-prefix (concat auto-saves-dir ".saves-")
        tramp-backup-directory-alist `((".*" . ,backup-dir))
        tramp-auto-save-directory auto-saves-dir
        )
  )
(setq backup-by-copying t    ; Don't delink hardlinks
      delete-old-versions t  ; Clean up the backups
      version-control t      ; Use version numbers on backups,
      kept-new-versions 3    ; keep some new versions
      kept-old-versions 2)   ; and some old ones, too

;; Buffer
;; ------------------------------------------------------------
;; maybe put this as use-package for future?
(ivy-mode 1) ;;enables ivy
;; some standards settings to begin with
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")

;; some more default settings to get started
(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop) ;;shows the kill ring

;; get help
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)

;; for emacs settings?
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)

(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view) ;;? do really get what this does...
(global-set-key (kbd "C-c V") 'ivy-pop-view)

;; some other kbd
(global-set-key (kbd "C-; n") 'new-frame)
(global-set-key (kbd "C-; c") 'delete-frame)
(global-set-key (kbd "C-; g") 'magit)
(global-set-key (kbd "C-; m") 'counsel-rhythmbox)
(global-set-key (kbd "C-; M") 'counsel-rhythmbox-playpause-current-song)

;; Editing
;; ------------------------------------------------------------
;; bindings for easier paragraph movement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
;; (load "~/.emacs.d/mr-editing.el")

;; Indent with of four and use tab to allow indentation
;; use M-i to insert tab
(setq-default tab-width 4
	indent-tabs-mode t)

;; Will highlight text in red if goes past 80 characters.
;; (does not work on startup ...)
(use-package column-enforce-mode
  :ensure t
  :init)
(setq-default global-column-enforce-mode t)

;; Autrowrap 80
;; still not working well, also does not matter all that much anyways (just use a
;; linter to fix inconsistencies)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)
(setq auto-fill-mode t)

;; Dired
;; ------------------------------------------------------------

(setq dired-listing-switches "-al --group-directories-first")

;; Eshell
;; ------------------------------------------------------------
;; minibuffer command
(global-set-key (kbd "C-; e") 'eshell)
(global-set-key (kbd "C-; M-e") 'eshell-command)
;; todo make the output of the command open in a new frame
(defun mkrun ()
	"execute make run command in eshell"
	(interactive)
	(with-selected-frame (make-frame)
		(eshell-command "make run")))
(setq eshell-prompt-function
	(lambda nil
		(concat 
			(propertize "[")
			(propertize (eshell/whoami))
			(propertize "@")
			(propertize (eshell/pwd))
			(propertize "]")
			(propertize "\n")
			(propertize "> "))))
(global-set-key (kbd "C-; r") 'mkrun)

;; Git
;; ------------------------------------------------------------
(use-package magit
  :ensure t
  :init)

;; Programming
;; ------------------------------------------------------------
;; Enable yasnippets for all modes
(use-package yasnippet
  :ensure t
  :init
    (yas-global-mode 1))

;; Syntax checking for all modes
(use-package flycheck
  :ensure t
  :init
    (global-flycheck-mode t))

;; setup company mode
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-; k") 'company-complete)
;; setup eglot ++++++++++++++++++
(use-package eglot :ensure t)
;; R
;; Go
(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
(add-hook 'go-mode-hook 'eglot-ensure)
(add-hook 'before-save-hook 'gofmt-before-save)
;; C++
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd-10"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(setq company-backends (delete 'company-semantic company-backends))
;; python
(add-hook 'python-mode-hook 'eglot-ensure)

;; add markdown syntax support for emacs
(use-package markdown-mode
  :ensure t
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))
