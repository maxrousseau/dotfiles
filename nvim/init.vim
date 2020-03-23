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
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='minimalist'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
Plug 'kien/ctrlp.vim'
"too slow
"Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-speeddating'
Plug 'neomake/neomake'
"call neomake#configure#automake('w')
let g:airline#extensions#neomake#enabled = 12
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
" support for rm and txt files
autocmd BufRead *.txt set filetype=markdown
autocmd BufRead *.Rmd set filetype=markdown
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
Plug 'iamcco/mathjax-support-for-mkdp'
	" snippets
	autocmd Filetype markdown inoremap ;h1 #<Space>
	autocmd Filetype markdown inoremap ;h2 ##<Space>
	autocmd Filetype markdown inoremap ;h3 ###<Space>
	autocmd Filetype markdown inoremap ;h4 ####<Space>
	autocmd Filetype markdown inoremap ;b ****<Esc>hi
	autocmd Filetype markdown inoremap ;i __<Esc>i
	autocmd Filetype markdown inoremap ;y ^^<Esc>i
	autocmd Filetype markdown inoremap ;u ~~<Esc>i
	autocmd filetype markdown inoremap ;l -<space>
	autocmd filetype markdown inoremap ;n 1.<space>
	autocmd filetype markdown inoremap ;h [](https://www.<++>)<Esc>F[a
	autocmd filetype markdown inoremap ;f [](../<++>)<Esc>F[a
	autocmd filetype markdown inoremap ;s ```<Return><++><Return>```<Esc>2ka
	autocmd filetype markdown inoremap ;a ![](<++>)<Esc>F[a
	autocmd filetype markdown inoremap ;c <!---<Return><Return>---><Esc>kI
Plug 'junegunn/goyo.vim'

" Latex ------------------------------
Plug 'lervag/vimtex'

" Python ------------------------------
let g:python3_host_prog = '/home/linuxbrew/.linuxbrew/bin/python3'
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
" Plug 'jalvesaq/Nvim-R'

" Git ------------------------------
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Terminal and WM -----------------

" Terminal navigation

" Terminal mappings
tnoremap <C-B><C-X> <C-\><C-n>
nnoremap <C-B><C-H> :sp<Bar>te<CR>
nnoremap <C-B><C-J> :vsp<Bar>te<CR>

" Tab/screen navigation
nnoremap <C-S><C-N> :tabNext<CR>
nnoremap <C-S><C-P> :tabPrevious<CR>
nnoremap <C-S><C-O> :tabnew<CR>
nnoremap <C-S><C-C> :tabclose<CR>

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"
" Txt -----------------------------
" anki optimizations
autocmd Filetype text set tw=0
autocmd Filetype text nnoremap <buffer> ;n oQ:<space><++>,<space>A:<space><++><Esc>I
autocmd Filetype text nnoremap <buffer> ;t oT/F:<space><++>,<space>A:<space><++><Esc>I
autocmd Filetype text nnoremap <buffer> ;m oQ:<space><++><space>\na)<space><++><space>\nb)<space><++><space>\nc)<space><++><space>\nd)<space><++><space>,<space><++><Esc>I

call plug#end()            " required
filetype plugin indent on    " required
set laststatus=2

"Colorscheme
colorscheme Monokai
