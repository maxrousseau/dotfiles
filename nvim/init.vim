"             /\
" /vvvvvvvvvvvv \--------------------------------------,
" `^^^^^^^^^^^^ /====================================="
"             \/
"nvim config
set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

set colorcolumn=80 
set clipboard+=unnamedplus
set timeoutlen=200
set cursorline
set list
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

inoremap <LocalLeader><Space> <Esc>/<++><Enter>"_c4l
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i

" General ------------------------------
Plug 'vim-scripts/The-NERD-tree'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
"too slow
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-speeddating'
Plug 'neomake/neomake'
"call neomake#configure#automake('w')
let g:airline#extensions#neomake#enabled = 1
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Snippets ------------------------------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" CPP ------------------------------------
Plug 'zchee/deoplete-clang'
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-6.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang/'


" Go ------------------------------------
"bad nvim version
"Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Markdown ------------------------------
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
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
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'vim-scripts/indentpython.vim'
Plug 'nvie/vim-flake8'
set encoding=utf-8
let python_highlight_all=1
syntax on
let NERDTreeIgnore=['\.pyc$', '\~$']

	"doc snippet
	autocmd Filetype python inoremap ;d """<Return><++><Return><Return><++><Return><Return>Parameters<Return>----------<Return><++><space>:<space><++><Return><Return>Returns<Return>------<Return><++><space>:<space><++><Return>"""<Esc>12kA

" R ------------------------------
Plug 'jalvesaq/Nvim-R'

" Git ------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

call plug#end()            " required
filetype plugin indent on    " required
set laststatus=2

"Colorscheme
colorscheme dracula
let g:airline_theme='base16'
set tw=79

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

