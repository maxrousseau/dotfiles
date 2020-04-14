"Minimalist vim config
"Maxime Rousseau
"10-Apr-2020

" Some options for editing
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
set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set number
set tw=79
set visualbell

" md and Rmd setting
autocmd BufRead *.Rmd set filetype=markdown
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:markdown_folding = 1
set foldmethod=syntax

" personal plugins TODO
" bufman -> managing buffers, open close, rename, etc...
" foldman -> managing folds: automatic fold for Rmd md and txt
let mapleader = ";"
nnoremap <Leader><Space> <Esc>/<++><Enter>"_c4l
nnoremap <Leader>o :call<Space>Open()<Enter>

" Window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
