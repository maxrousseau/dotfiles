" Vimrc
" Maxime Rousseau
" 11-Mai-2020
" ***********

" General
" -------
" Misc options
filetype plugin on
syntax on
set autoindent
set background=dark
set backspace=2
set laststatus=2
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set nocompatible
set colorcolumn=80
highlight ColorColumn ctermbg=8 guibg=lightgrey
set clipboard+=unnamedplus
set timeoutlen=200
set cursorlineopt=number
set list
set list listchars=nbsp:¬,tab:··,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set tw=79
set visualbell

" Easy reload
nnoremap <C-r> :so $HOME/.vimrc<Enter>

" Leaders
let mapleader = "."
let maplocalleader = ";"

" Insert tags
nnoremap <LocalLeader><Space> <Esc>/<++><Enter>d4li

" Markdown
" --------
" settings:
" - enable folding to syntax
" - read Rmd as md
autocmd BufRead *.Rmd set filetype=markdown
setlocal foldmethod=syntax
let g:markdown_folding = 1

" Buffers
" -------
" mappings
" > ;o open browser
" > ;n go to next buffer
" TODO: cmd to load all files in a directory
"		use buffers menu to select file without :cmd
nnoremap <silent> <LocalLeader>o :e .<CR>
nnoremap <silent> <LocalLeader>n :bnext<CR>
nnoremap <silent> <LocalLeader>k :bprevious<CR>
nnoremap <silent> <LocalLeader>l :buffers<CR>

" Snippets
" --------
" type the abbreviation followed the press <space>
" TODO: setup snippets folder
autocmd FileType python
	\ iabbrev def def<++>(<++>):<Esc>0;<space>

" Movement
" --------
" > ;s search word under cursor
nnoremap <silent> <LocalLeader>s /<c-r>=expand("<cword>")<CR><CR>

" Docs
" TODO: lookup python docs

" Window navigation
" -----------------
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
