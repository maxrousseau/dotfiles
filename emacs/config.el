;; Vanilla emacs config
;;		> no third party packages to be downloaded from melpa
;;		> all sources must be self contianed in this directory
;; Maxime Rousseau
;;
;; Startup
;; ------------------------------------------------------------
(setq inhibit-startup-screen t)
(cd "~/src/")
(split-window-right)
;;@TODO add a favorites buffer list
;; > define list of buffers to be opened automatically > log.md, config.el,
;;etc...
(setq default_buffers (list "log/src/chaos.org" "dotfiles/emacs/config.el"))
    ;; (find-file-noselect ) loop overfiles with 'dolist' and open silently
(ibuffer)
(global-set-key (kbd "C-; b") 'ibuffer)

;; Appearance
;; ------------------------------------------------------------
;; no bell
(setq ring-bell-function 'ignore)

;; themes
(add-to-list 'custom-theme-load-path "~/src/dotfiles/emacs/themes/")
(load-theme 'badwolf t)

;; some highlighting of keywords
(global-hi-lock-mode 1)
(defun meta_highlight()
  "highlight todos, notes and more"
  (highlight-regexp "@TODO" 'hi-pink)
  (highlight-regexp "@BUG" 'hi-red)
  (highlight-regexp "@REFACTOR" 'hi-green)
  (highlight-regexp "@DONE" 'hi-blue)) ;;not working
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
(set-frame-font "Spleen 32x64 12" nil t)
;; more normal hack font...
;;(set-frame-font "Hack 10" nil t)

;; does not display line numbers by default
(global-linum-mode 1)
(global-set-key (kbd "C-; l") 'global-linum-mode)

;; Dired
;; ------------------------------------------------------------
(setq dired-listing-switches "-l --group-directories-first")
;;@TODO setup keybind for open-with and specify app
;; use external app to open file from dired
;; taken from xah lee
(defun xah-open-in-external-app (&optional @fname)
  "Open the current file or dired marked files in external app.
When called in emacs lisp, if @fname is given, open that.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04 2021-02-16"
  (interactive)
  (let* (
         ($file-list
          (if @fname
              (progn (list @fname))
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name)))))
         ($do-it-p (if (<= (length $file-list) 5)
                       t
                     (y-or-n-p "Open more than 5 files? "))))
    (when $do-it-p
      (cond
       ((string-equal system-type "windows-nt")
        (mapc
         (lambda ($fpath)
           (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name $fpath )) "'")))
         $file-list))
       ((string-equal system-type "darwin")
        (mapc
         (lambda ($fpath)
           (shell-command
            (concat "open " (shell-quote-argument $fpath))))  $file-list))
       ((string-equal system-type "gnu/linux")
        (mapc
         (lambda ($fpath) (let ((process-connection-type nil))
                            (start-process "" nil "xdg-open" $fpath))) $file-list))))))
(define-key dired-mode-map (kbd "C-; o") 'xah-open-in-external-app)
(add-hook 'dired-mode-hook
	  (lambda ()
	    (dired-hide-details-mode)))

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
;; snome standards settings to begin with
;; some more default settings to get started


;; some other kbd
(global-set-key (kbd "C-; n") 'make-frame)
(global-set-key (kbd "C-; c") 'delete-frame)


;; Editing
;; ------------------------------------------------------------
;; bindings for easier paragraph movement
(load "~/src/dotfiles/emacs/mr-editing.el")

;; Indent with of four and use tab to allow indentation
;; use M-i to insert tab
(setq-default tab-width 4 indent-tabs-mode t)

;; @TODO write clean up macro for editing pdf text (clean-up for various glyphs
;; and whitespace)

;; Autrowrap 120
;; still not working well, also does not matter all that much anyways (just use a
;; linter to fix inconsistencies)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'prog-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)
(setq auto-fill-mode t)




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
;; @TODO Snippets (see the .el file which allows to customize snippets manually)
;; @TODO Syntax checking for all modes?
;; @TODO Setup autocomplete C-; K
;; @TODO CTags view and Ag setup for code navigation
;; @TODO customize Ibuffer and Occur behaviour to improve code navigation and refactoring
;; @TODO customize Icomplete, Ido mode
(global-set-key (kbd "C-; k") 'dabbrev-expand)
(icomplete-mode t)

;; python mode
;; @TODO black formatting and reload upon save
(add-hook 'python-mode-hook
    (lambda ()
	    (setq-default indent-tabs-mode nil)
	    (setq-default tab-width 4)
	    (setq-default py-indent-tabs-mode t)
    (add-to-list 'write-file-functions 'delete-trailing-whitespace)))
