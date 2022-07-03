;; Vanilla emacs config
;;		> no third party packages to be downloaded from melpa
;;		> all sources must be self contianed in this directory
;;      > use git-submodule to make it easily portable
;; Maxime Rousseau
;;
;;             /\
;; /vvvvvvvvvvvv \--------------------------------------,
;; `^^^^^^^^^^^^ /====================================="
;;             \/
;;
;; ================================================================================
;;
;; Packages:
;;	Yasnippets
;;	Company (elpa), python-jedi
;;	Swiper, ivy, counsel (elpa)
;;	Evil,
;;
;; User defined default variables
;; ------------------------------------------------------------
;; (setq source_dir "~/src/")
;; Startup emacs in the source directory and open the default buffers.
;; windows
(setq source_dir "C:\\Users\\roum5\\source\\")
(setq file_list (list
		 "log/src/orthodontics.org"
		 "log/src/chaos.org"
		 "dotfiles/emacs/config.el"))
(setq default_buffers (mapcar (lambda (x) (concat source_dir x)) file_list)) ;; concatenate to file-list
;; Evil-mode (because otherwise i'll be getting cubital tunnel)
;; ------------------------------------------------------------
;; @TODO set evil keybindings with local leader for common commands
;; @TODO improve window switching keybindings
;; @TODO setup undo-redo commands
;; @TODO olivetti mode
;; @TODO emojis
;; @TODO static website in org=mode (custom html/css export)
;; @TODO remap these asap > (other-window), (switch-to-buffer), etc
(add-to-list 'load-path "C:/Users/roum5/source/dotfiles/emacs/evil-leader")
(add-to-list 'load-path "C:/Users/roum5/source/dotfiles/emacs/evil")
(add-to-list 'load-path "C:/Users/roum5/source/dotfiles/emacs/evil-org-mode")
(add-to-list 'load-path "C:/Users/roum5/source/dotfiles/emacs/swiper")
(add-to-list 'load-path "C:/Users/roum5/source/dotfiles/emacs/themes/")

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")

(require 'evil)
(evil-mode 1)
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)
(blink-cursor-mode -1) ;; @BUG -  disable cursor blinking or evil mode in the doc-view buffer, cursor blinking disabled completely

;; Appearance
;; ------------------------------------------------------------
;; @TODO - whitespace and tab view
;; no bell
;; themes
(add-to-list 'custom-theme-load-path (concat source_dir "dotfiles/emacs/themes/"))
(setq ring-bell-function 'ignore)
(load-theme 'dracula t)

;; some highlighting of keywords
(global-hi-lock-mode 1)
(defun meta_highlight()
  (interactive)
  "highlight todos, notes and more"
  (highlight-regexp "@TODO" 'hi-pink)
  (highlight-regexp "@BUG" 'hi-red)
  (highlight-regexp "@HERE" 'hi-green)
  (highlight-regexp "@NOTE" 'hi-blue))
(add-hook 'find-file-hook (lambda () (meta_highlight)))

;; This status line is not great, improve on clarity of information displayed.
(display-time-mode 1)

;; highlight current line
(global-hl-line-mode 0)

;; disable all GUI bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; dope bitmap fonts
;;(set-frame-font "Spleen 32x64 10" nil t)
;;(set-frame-font "scientifica 12" nil t)
;;(set-frame-font "IBMPlexMono 10" nil t)
;; add gnu unifont
(set-frame-font "Iosevka 10" nil t)
;;@TODO -- emoji display problem...
;;(set-frame-font "Hack 12" nil t)

;; does not display line numbers by default, ps: linum-mode is very slow
(setq display-line-numbers-type t)
(global-set-key (kbd "C-; l") 'display-line-numbers-mode)

;; Org
;; ------------------------------------------------------------
;; @NOTE (org daily) -- a dashboard for tracking daily todos/goals and what was
;; done, once day completed, move to a log file

(setq org-agenda-files (list (car default_buffers)))
(setq org-log-done t)
(eval-after-load "org" '(progn
						  (define-key org-mode-map (kbd "C-c a") 'org-agenda)
						  (define-key org-mode-map (kbd "C-; /") 'counsel-org-goto-all)))
;; M-x ielm for the elisp repl
;; @TODO keybinding for dired-at-point for folders

(setq org-image-actual-width nil) ;;To set image scale

;; beamer setup
;; @BUG - currently haven't been able to work out a proper latex or beamer
;; template for documents in org-mode
;; okay I have a template that seems stable-ish
;; kybind for -- org-beamer-select-environment
(add-hook 'org-beamer-mode-hook
		  (lambda () (local-set-key (kbd "C-; e") 'org-beamer-select-environment)))


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
(eval-after-load "dired" '(progn
			    (define-key dired-mode-map (kbd "C-; o") 'xah-open-in-external-app) ))
(add-hook 'dired-mode-hook
	  (lambda ()
	    (dired-hide-details-mode) ))

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
;; some other kbd
(global-set-key (kbd "C-; n") 'make-frame)
(global-set-key (kbd "C-; c") 'delete-frame)



;; Editing
;; ------------------------------------------------------------
;; bindings for easier paragraph movement
;; @TODO allow for easier intra-line and inter-line navigation, either use snipe
;; or copy similar behaviour M-f, M-b is not good @NOTE - imenu-ido-symbol mode
;; looks like a good hack, try that first (https://www.emacswiki.org/emacs/idomenu.el)
;; @TODO CTags view and Ag setuup for code navigation
;; @TODO customize Ibuffer and Occur behaviour to improve code navigation and refactoring
;; @TODO bookmark key binding to navigate code (add, list and delete/clear)
(load (concat source_dir "dotfiles/emacs/mr-editing.el"))

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
(setq-default fill-column 120)
(setq auto-fill-mode t)

;; swiper setup
(require 'ivy)
(require 'swiper)
(require 'counsel)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
;; @TODO setup keybindings
;;@BUG this requires counsel to be installed (M-x package-install counsel from elpa)
(evil-global-set-key 'normal (kbd "/") 'swiper-isearch)
(evil-global-set-key 'insert (kbd "TAB") 'dabbrev-completion)
(global-set-key (kbd "C-s") 'swiper-isearch)
;;(global-set-key (kbd "M-x") 'counsel-M-x)


(evil-leader/set-key
  "f" 'counsel-find-file
  "b" 'ivy-switch-buffer
  "o" 'other-window)


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
;; @TODO figure out how to fix eshell read-only mode
(global-set-key (kbd "C-; B") 'bat_build)

;; Programming
;; ------------------------------------------------------------
;; @TODO Snippets (see the .el file which allows to customize snippets manually)
;; @TODO Syntax checking for all modes?
;; @TODO Setup autocomplete C-; K and LSP
(global-set-key (kbd "C-; k") 'dabbrev-expand)
(icomplete-mode t)

;; python mode
;; @TODO black formatting and reload upon save
;; build function to execute program
;; flymake of flycheck setup
(add-hook 'python-mode-hook
    (lambda ()
	    (setq-default indent-tabs-mode nil)
	    (setq-default tab-width 4)
	    (setq-default py-indent-tabs-mode t)
		(add-to-list 'write-file-functions 'delete-trailing-whitespace)))


;; Startup
;; ------------------------------------------------------------
(setq inhibit-startup-screen t)
(split-window-right)
;;@TODO
;;> pubsearch.el -- desired functionalities: pubsearch integration (browse pubmed, arxiv abstracts with associated bibtex citation for easy import)
;;> case study presentation build script (case.el, use pynoter for ppt?, user beamer for academia)
;;> french and english spellchecker *PRIORITY*
;;> setup org agenda
;;> setup snippets
;;> pomodoro mode
;;@BUG -- change homedir path based on the OS
;; add a favorites buffer list
;; > define list of buffers to be opened automatically > log.md, config.el,
;; Startup emacs in the source directory and open the default buffers.
(mapcar 'find-file-noselect default_buffers);; open silently all default buffers
(ibuffer)
(global-set-key (kbd "C-; b") 'ibuffer)
(cd source_dir)
(add-to-list 'write-file-functions 'delete-trailing-whitespace)

(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True")
;; How to load ipython with these commands and
;; %load_ext autoreload
;; %autoreload 2
;; -----
;; python-check with black on save
