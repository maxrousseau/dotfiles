set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set colorcolumn=80 
call vundle#begin('~/.vim/bundle')

" alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-scripts/The-NERD-tree'
Plugin 'Buffergator'
Plugin 'Reewr/vim-monokai-phoenix'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
"Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'myusuf3/numbers.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'ying17zi/vim-live-latex-preview'

Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}


" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
"filetype plugin on

"""python3 from powerline.vim import setup as powerline_setup
""python3 powerline_setup()
""python3 del powerline_setup
""set rtp+=/home/max/.local/lib/python2.7/site-packages    

set laststatus=2

"Colorscheme
colorscheme CandyPaper

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" To get plugins from Vim Scripts, you can reference the plugin
" by name as it appears on the site
