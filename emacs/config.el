;; Vanilla emacs config
;;		> no third party packages
;; Maxime Rousseau
;;
;; Startup
;; ------------------------------------------------------------
;;@TODO make a little splash screen with useful directories and projects...
(setq inhibit-startup-screen t)
(cd "c:/Users/roum5/source/")
(split-window-right)

;; Appearance
;; ------------------------------------------------------------
;; no bell
(setq ring-bell-function 'ignore)

;; @TODO - > Themes
(load "C:/Users/roum5/source/dotfiles/emacs/molokai-theme.el")
(load "C:/Users/roum5/source/dotfiles/emacs/oldlace-theme.el")
(load-theme 'oldlace t)

;;
(global-hi-lock-mode 1)
(defun meta_highlight()
  "highlight todos, notes and more"
  (highlight-regexp "@TODO" 'hi-pink)
  (highlight-regexp "@BUG" 'hi-red)
  (highlight-regexp "@REFACTOR" 'hi-green))
(add-hook 'find-file-hook (lambda () (meta_highlight)))

;; This status line is not great, improve on clarity of information displayed.
(display-time-mode 1)

;; highlight current line
(global-hl-line-mode 1)

;; disable all GUI bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; dope bitmap font
;;(set-frame-font "Spleen 32x64 12" nil t)
;; more normal hack font...
(set-frame-font "Hack 10" nil t)

;; does not display line numbers by default
;; toggle with keybinding C-= l
(global-linum-mode 1)
(global-set-key (kbd "C-; l") 'global-linum-mode)


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

;; some standards settings to begin with
;; some more default settings to get started


;; some other kbd
(global-set-key (kbd "C-; n") 'new-frame)
(global-set-key (kbd "C-; c") 'delete-frame)


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


;; Autrowrap 120
;; still not working well, also does not matter all that much anyways (just use a
;; linter to fix inconsistencies)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 120)
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
;; run and build commands
(defun bat_build()
	"execute make run command in eshell"
	(interactive)
	(eshell-command "build.bat"))
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
(global-set-key (kbd "C-; b") 'bat_build)

;; Programming
;; ------------------------------------------------------------
;; @TODO Snippets
;; @TODO Syntax checking for all modes?
;; @TODO Setup autocomplete C-; K
