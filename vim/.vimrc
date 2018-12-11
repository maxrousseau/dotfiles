set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set colorcolumn=80
call plug#begin('~/.local/share/nvim/plugged')
inoremap <LocalLeader><Space> <Esc>/<++><Enter>"_c4l
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
set clipboard+=unnamedplus

" General ------------------------------
Plug 'vim-scripts/The-NERD-tree'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-speeddating'
set list
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

set background=dark

" Snippets ------------------------------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Go ------------------------------------
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Markdown ------------------------------
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
"
	" snippets
	autocmd Filetype markdown inoremap ;h1 #<Space>
	autocmd Filetype markdown inoremap ;h2 ##<Space>
	autocmd Filetype markdown inoremap ;h3 ###<Space>
	autocmd Filetype markdown inoremap ;h4 ####<Space>
	autocmd Filetype markdown inoremap ;b ****<Esc>hi
	autocmd Filetype markdown inoremap ;i ____<Esc>hi
	autocmd filetype markdown inoremap ;l -<space>
	autocmd filetype markdown inoremap ;n 1.<space>
	autocmd filetype markdown inoremap ;h [](https://www.<++>)<Esc>F[a
	autocmd filetype markdown inoremap ;f [](../<++>)<Esc>F[a
	autocmd filetype markdown inoremap ;s ```<Return><++><Return>```<Esc>2ka
	autocmd filetype markdown inoremap ;a ![](<++>)<Esc>F[a
	autocmd filetype markdown inoremap ;c <!---<Return><Return>---><Esc>kI

" Latex ------------------------------
Plug 'lervag/vimtex'

" Python ------------------------------
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
set encoding=utf-8
let python_highlight_all=1
syntax on
let NERDTreeIgnore=['\.pyc$', '\~$']

	"snippets
	autocmd Filetype python inoremap ;d """<Return><++><Return><Return><++><Return><Return>Parameters<Return>----------<Return><++><space>:<space><++><Return><Return>Returns<Return>------<Return><++><space>:<space><++><Return>"""<Esc>12kA
" C/C++ ------------------------------

" R ------------------------------
Plug 'jalvesaq/Nvim-R'

" Git ------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Json ------------------------------

" csv ------------------------------

call plug#end()				" required
filetype plugin indent on	" required
set laststatus=2

"Colorscheme
" colorscheme dracula
let g:airline_theme='atomic'
set tw=79

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

