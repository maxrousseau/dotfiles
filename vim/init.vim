"             /\
" /vvvvvvvvvvvv \--------------------------------------,
" `^^^^^^^^^^^^ /====================================="
"             \/
"	nvimconfig @ maxrousseau
"	4/11/2021
" =============================================================================
set nocompatible
filetype off

set colorcolumn=80

inoremap <LocalLeader><Space> <Esc>/<++><Enter>"_c4l
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

" font
set guifont=hack:h12:cANSI

" remove annoying sound and flash
set noeb vb t_vb=
au GUIEnter * set vb t_vb=
set ghr=0

" fixes backspace in insert mode
set backspace=indent,eol,start

" remove toolbar, scrollbar and menubars
set guioptions-=L
set guioptions-=m
set guioptions-=T
set guioptions-=r

" some settings
set list
set list listchars=tab:>-,trail:-
set shiftwidth=4
set softtabstop=4
set tabstop=4
set background=dark
set encoding=utf-8
syntax on
set laststatus=2
set tw=79
set relativenumber

" Easy reload
nnoremap <C-r> :so $USERPROFILE/AppData/Local/nvim/init.vim<Enter>

" Leaders
let mapleader = "."
let maplocalleader = ";"

" Insert tags
nnoremap <LocalLeader><Space> <Esc>/<++><Enter>d4li

" setup for plugins
filetype plugin indent on	" required
call plug#begin('~/.local/share/nvim/plugged')

" Markdown
" --------
" settings:
" - enable folding to syntax
" - read Rmd as md
" - @TODO: read org files?
autocmd BufRead *.Rmd set filetype=markdown
setlocal foldmethod=syntax
let g:markdown_folding = 1

" Buffers
" -------
" TODO: ripgrep for easy file/buffer navigation
nnoremap <LocalLeader>b :buffers<CR>:buffer<Space>
set wildmenu
set wildmode=full
nnoremap <LocalLeader>f :find<Space>
nnoremap <LocalLeader>d :Explore<Enter>
" > some tips on how to setup netrw https://shapeshed.com/vim-netrw/

" Git
" ---
" TODO: vim fugitive

" Movement
" --------
" TODO: vim-snipe or vim-sneak, multiline editing

" Appearance
" ----------
" TODO: statusbar and base-16 color
Plug 'chriskempson/base16-vim'

" Snippets
" --------
" TODO: setup ultisnip

" python version
let python_highlight_all=1
let pythonthreedll="C:\Program Files\Python 3.5\python35.dll"

" Window navigation
" -----------------
" Sane shortcuts for pane switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

call plug#end()

colorscheme base16-ashes
"Benokai?
