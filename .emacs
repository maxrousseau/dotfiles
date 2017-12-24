; packages setup
(require 'package)			

; add MELPA repo to list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))

; initialize package.el
(package-initialize)

; evil mode setup 
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; neotree setup
(add-to-list 'load-path "~/.emacs.d/elpa/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-quick-look)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

; auto complete setup
(require 'auto-complete)

; add zen mode
(add-to-list 'load-path "~/.emacs.d/elpa/zen-mode/")

(require 'zen-mode)
(global-set-key (kbd "C-M-z") 'zen-mode)

;; setup elpy (python IDE)
(package-initialize)
(elpy-enable)

;; setup go-mode
(add-to-list 'load-path "~/.emacs.d/elpa/go-mode-20170726.555/")
(require 'go-mode)

;; autocomplete setup for go
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

; auto complete auctex
(require 'auto-complete-auctex)
; outline window
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
(setq reftex-plug-into-AUCTeX t) ; Anleitung S. 4

;; setup flyspell for text correction
(add-hook 'LaTeX-mode-hook 'flyspell-mode)

; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

; setup powerline
(require 'powerline)
(powerline-center-evil-theme)

; setup relative line number
(require 'linum-relative)
(linum-relative-on)
(linum-relative-mode)

; org-evil setup
(add-to-list 'load-path "~/.emacs.d/elpa/org-evil-20171004.255/")
(require 'org-evil)

; org path to agenda
(setq org-agenda-files
        '("~/Document/work/TODO.org"))

; setup color theme
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-dark-laptop)
(color-theme-arjen)

; wrap text at 80 char
(add-hook 'text-mode-hook 'auto-fill-mode)
(setq-default fill-column 80)

; yasnippet setup
(require 'yasnippet)
(yas-global-mode 1)

; auto-complete-c-headers-setup
;; initializes package on a c and cpp files
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (setq achead:include-directories
	   (append '("/usr/include/c++/5"
		     "/usr/include/x86_64-linux-gnu/c++/5"
		     "/usr/include/c++/5/backward"
		     "/usr/lib/gcc/x86_64-linux-gnu/5/include"
		     "/usr/lib/gcc/x86_64-linux-gnu/5/include-fixed"
		     "/usr/include/x86_64-linux-gnu")
		   achead:include-directories)))

; call function from hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; latex setup for autocompletion
;(add-to-list 'ac-modes 'latex-mode) ; beware of using 'LaTeX-mode instead
;(require 'ac-math) ; package should be installed first
;(defun my-ac-latex-mode () ; add ac-sources for latex
  ;(setq ac-sources
	;(append '(ac-source-math-unicode
		  ;ac-source-math-latex
		  ;ac-source-latex-commands)
		;ac-sources)))
;(add-hook 'LaTeX-mode-hook 'my-ac-latex-mode)
;(setq ac-math-unicode-in-math-p t)
;(ac-flyspell-workaround) ; fixes a known bug of delay due to flyspell (if it is there)
;(add-to-list 'ac-modes 'org-mode) ; auto-complete for org-mode (optional)
;(require 'auto-complete-config) ; should be after add-to-list 'ac-modes and hooks
;(ac-config-default)
;(setq ac-auto-start nil)            ; if t starts ac at startup automatically
;(setq ac-auto-show-menu t)
;(global-auto-complete-mode t) 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-use-system-font t)
 '(org-agenda-files (quote ("~/Documents/work/TODO.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
