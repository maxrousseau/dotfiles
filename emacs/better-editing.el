;; personal elisp file for editing

;; smart delete
;; > if cursor on whitespace, delete until the next character
;; > if cursor on word, delete word (OK)
;; > if cursor on symbol, delete symbol

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
	  (nil)
	  (backward-word)))

;; delete word under cursor
(defun mr-delete-word ()
  "delete word under cursor"
  (interactive)
  (mr-beginning-word)
  (kill-word 1))



 
