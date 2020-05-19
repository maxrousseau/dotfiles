# TODO:
#	1. put aliases and functions in separate files
#	2. see fzf for useful functions

# Enable colors and change prompt:
autoload -U colors && colors	# Load colors
PS1='%F{blue}%B%1~%b%f %F{red}+>%f '
RPS1='[%F{yellow}%?%f%F{white}:%f%F{green}%@%f]'
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.

# History in cache directory:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.cache/zsh/history

# functions
#----------------------------------------
# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
# zsh autoload function
vf() {
  local files
  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})
  if [[ -n $files ]]
  then
    vim -- $files
    print -l $files[1]
  fi
}

# aliases
#----------------------------------------
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cl='clear'
alias nvim='~/src/neovim-0.4.3/squashfs-root/usr/bin/nvim'
alias vi='vim'
#alias vf='vim $(fzf)'
alias zf='zathura $(fzf)'
alias t='tmux'
alias tl='tmux list-session'
alias ta='tmux attach -t'
alias tk='tmux kill-session -t'
# backup alias
# alias mybackup="rsync -av --timeout=60 --progress /home/max/Documents/work \
# /media/max/Seagate\ Backup\ Plus\ Drive/zenbook"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# History in insert mode
bindkey -M viins '^p' up-history

# keybinds
#----------------------------------------
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# defaults
#----------------------------------------
export VISUAL=vim
export EDITOR="$VISUAL"
export MANPAGER=less
export XDG_CONFIG_DIR="$HOME/.config/"

# development environment
#----------------------------------------
# homebrew paths
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# virtualenv
export VIRTUALENVWRAPPER_PYTHON=/home/linuxbrew/.linuxbrew/bin/python3
export WORKON_HOME=$HOME/.envs
source /home/linuxbrew/.linuxbrew/bin/virtualenvwrapper.sh
export PATH="$HOME/.cargo/bin:$PATH"

# Load syntax highlighting; should be last
# source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
