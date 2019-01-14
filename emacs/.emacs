;; initialize package manager
(package-initialize)

;; display column number
(column-number-mode 1)

;; auto insert closing bracket
(electric-pair-mode 1)

;; remove bars
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; line numbers
(global-linum-mode 1)
(linum-relative-mode 1)

;; column highlight at 80
;; (require 'column-marker)
;; (add-hook 'foo-mode-hook (lambda () (interactive) (column-marker-1 80)))
