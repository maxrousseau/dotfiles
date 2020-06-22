;; Personal elisp file for editing

;; Smart delete
;; > if cursor on whitespace, delete until the next character (TODO)
;; > if cursor on word, delete word (OK)
;; > if cursor on symbol, delete symbol only (TODO)

;; Whitespace movement
;; > move backwards/forward along whitespace
;; > move up/down along whitelines

;; Substitution remap

;; TODO:
;; 1. functions
;; - type of thing
;; - beginning whitespace
;; - del whitespace
;; - del symbol
;; 2. fix variable (setq causes elint issues)

;; move to beginning of word cursor is on
(defun mr-beginning-word ()
  "go to beginning of word"
  (interactive)
  (setq cword (thing-at-point 'word))
  (setq cchar (thing-at-point 'char))
  (setq bchar (substring cword 0 1))
  (if (equal cchar bchar)
	  ()
	  (backward-word)))

;; delete word under cursor
(defun mr-delete-word ()
  "delete word under cursor"
  (interactive)
  (if (thing-at-point 'word)
	  (mr-beginning-word)
	());; symbol will simply run kill word
  (kill-word 1))

;; delete line under cursor
(defun mr-delete-line ()
  "delete the whole line which cursor is on"
  (interactive)
  (move-beginning-of-line nil)
  (kill-line nil))

;; default keybindings
(global-set-key (kbd "C-[ d") 'mr-delete-word)
(global-set-key (kbd "C-[ D") 'mr-delete-line)

;; bindings for easier paragraph movement
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
