#!/usr/bin/env bash
# small cli to help manage linux system

# soft linking all config files
ln -sf /home/max/src/dotfiles/bash/.bashrc ~/.bashrc
ln -sf /home/max/src/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf /home/max/src/dotfiles/emacs/settings.org ~/.emacs.d/settings.org
ln -sf /home/max/src/dotfiles/xterm/.Xresources ~/.Xresources
ln -sf /home/max/src/dotfiles/misc/.Xmodmap ~/.Xmodmap
ln -sf /home/max/src/dotfiles/openbox/* ~/.config/openbox/
ln -sf /home/max/src/dotfiles/rofi/* ~/.config/rofi

# terminal, tmux and shell
# emacs
# rofi

# fonts
# packages
# system health checks

# MOTD and startup (maybe do this in elisp?)
