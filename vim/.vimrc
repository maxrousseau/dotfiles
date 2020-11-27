" =============================================================================
"        ,--.!,
"     __/   -*-
"   ,d08b.  '|`
"   0088MM
"   `9MMP'
"			vimconfig @ maxrousseau
" =============================================================================

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
set list
set list listchars=nbsp:¬,tab:\|\·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set tw=79
set visualbell
set relativenumber
set cursorline

" Easy reload
nnoremap <C-r> :so $HOME/.vimrc<Enter>

" Leaders
let mapleader = "."
let maplocalleader = ";"

" Insert tags
nnoremap <LocalLeader><Space> <Esc>/<++><Enter>d4li

" Plugin Manager
" --------------
" handles installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" setup
call plug#begin('~/.vim/plugged')

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
" TODO: setup fzf OK, ripgrep for easy file/buffer navigation
" >>> get fzf 'Files' to find dotfiles
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <LocalLeader>b :Buffers<Enter>
nnoremap <LocalLeader>f :Files<Enter>
nnoremap <LocalLeader>d :Explore<Enter>

" Git
" ---
" TODO: vim fugitive

" Movement
" --------
" TODO: vim-snipe or vim-sneak and multiline editing linum-relative

" Appearance
" ----------
" TODO: statusbar and base-16 color
Plug 'chriskempson/base16-vim'
let base16colorspace=256


" Snippets
" --------
" TODO: setup ultisnip


call plug#end()
colorscheme base16-unikitty-dark

" Window navigation
" -----------------
" Sane shortcuts for pane switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>




