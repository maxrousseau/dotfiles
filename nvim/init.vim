set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set colorcolumn=80 
call plug#begin('~/.local/share/nvim/plugged')
inoremap <LocalLeader><Space> <Esc>/<++><Enter>"_c4l

" General ------------------------------ 
Plug 'vim-scripts/The-NERD-tree'
Plug 'Reewr/vim-monokai-phoenix'
Plug 'myusuf3/numbers.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" Snippets ------------------------------
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
" Plug 'Valloric/YouCompleteMe'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" Markdown ------------------------------
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
" Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'iamcco/markdown-preview.vim'
Plug 'miyakogi/livemark.vim'
" let vim_markdown_preview_hotkey='<C-m>' 
" let vim_markdown_preview_browser='chromium'
" let vim_markdown_preview_github=1
let g:livemark_python = '/usr/bin/python3' " default 'python3'
let g:livemark_browser = 'firefox'  "default: 'google-chrome'<Paste>

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
	autocmd Filetype python inoremap ;d """<Return><Return>Description:<Return><++><Return><Return><Backspace>Args:<Return><++><Return><Return><Backspace>Return:<Return><++><Return><Return>"""<Esc>11ka
" C/C++ ------------------------------

" R ------------------------------
Plug 'jalvesaq/Nvim-R'

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
let g:airline_theme='base16'
set tw=79

" Support python3
let g:python_host_prog = '/usr/bin/python3'
" let g:ycm_python_binary_path = '/usr/bin/python3'

:tnoremap <Esc> <C-\><C-n>

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

