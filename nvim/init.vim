set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set colorcolumn=80 
call plug#begin('~/.local/share/nvim/plugged')

" General ------------------------------ 
Plug 'vim-scripts/The-NERD-tree'
Plug 'Reewr/vim-monokai-phoenix'
" Plug 'scrooloose/syntastic'
Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'

" Snippets ------------------------------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'Valloric/YouCompleteMe'

" Latex ------------------------------
Plug 'lervag/vimtex'

" Python ------------------------------  
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
set encoding=utf-8
let python_highlight_all=1
syntax on
let NERDTreeIgnore=['\.pyc$', '\~$'] 

" C/C++ ------------------------------

" R ------------------------------

" Git ------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
 
" Json ------------------------------

" csv ------------------------------

call plug#end()            " required
filetype plugin indent on    " required
set laststatus=2

"Colorscheme
colorscheme monokai-phoenix
let g:airline_theme='atomic'

" Localleader **fix**
let maplocalleader = '\\'

" Support python3
let g:python_host_prog = '/usr/bin/python3.5'
let g:python_host_prog = '/usr/bin/python2.7'
let g:ycm_python_binary_path = '/usr/bin/python3.5'

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

