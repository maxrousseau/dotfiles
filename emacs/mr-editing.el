;; Personal elisp file for editing

;;@TODO Smart delete (C-d trigger...)
;; maybe I should make a minor mode for deletion which binds single key for
;; line, word or regions?
;; > if cursor on whitespace, delete until the next character (@TODO)
;; > if cursor on word, delete word (@DONE)
;; > if cursor on symbol, delete symbol only (@TODO)

;; Smart insert... C-i  (insert snippets/one or multiple objects at indent level)
;; Smart movement... C-m (move along class/function/variable)


;;@DONE Whitespace movement
;; > move backwards/forward along whitespace (M-f / M-b)
;; > move up/down along whitelines (M-n / M-p)

;; Substitution remap
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

;; delete to line start
(defun mr-delete-to-begining-line ()
  "deletes from the position of the cursor to the beginning of the line"
  (interactive)
;;  (set-mark (point))
;;  (beginning-of-line)
  (delete-region (beginning-of-line) (point)))

;; Deletion keybindings
;; @TODO create a minor mode (`) for easier modal style editing
;;(global-set-key (kbd "C-d d") (delete-char(point)))
(global-set-key (kbd "C-; d") 'mr-delete-word)
(global-set-key (kbd "C-; D") 'mr-delete-line)
;;(global-set-key (kbd "C-d a") 'mr-delete-to-begining-line)
