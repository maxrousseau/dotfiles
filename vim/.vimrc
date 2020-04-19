"Minimalist vim config
"Maxime Rousseau
"10-Apr-2020

" Some options for editing
filetype plugin on
syntax on
set background=dark
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set nocompatible
set colorcolumn=80
highlight ColorColumn ctermbg=8 guibg=lightgrey
set clipboard+=unnamedplus
set timeoutlen=200
set cursorline
set list
set list listchars=nbsp:¬,tab:··,trail:·,extends:>
set shiftwidth=2
set softtabstop=2
set tabstop=2
set number
set tw=79
set visualbell

" md and Rmd setting
autocmd BufRead *.Rmd set filetype=markdown
let g:markdown_folding = 1
set foldmethod=syntax

" personal plugins TODO
" bufman -> managing buffers, open close, rename, etc...
" foldman -> managing folds: automatic fold for Rmd md and txt
" indentor ->
let mapleader = ";"
nnoremap <Leader><Space> <Esc>/<++><Enter>"_c4l

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
