#!/usr/bin/env bash
# small cli to help manage linux system

# *****
# Filesystem setup TODO
# 1. make a list of all dirs that are use in the script
# 2. check if exists, if not create
HOME=/home/max
SRC="$HOME"/src
DOC="$HOME"/doc
# etc...

# *****
# auto backup on prompt

# *****
# packages
# get PPAs

# tmux
# emacs
# rofi

# *****
# fonts (download terminus, spleen and hack?)
FONT_SPLEEN=/home/max/src/myfonts/spleen-1.8.2
if  [ -d "$FONT_SPLEEN" ]; then

	echo "spleen font already downloaded"

else

	echo "$FONT_SPLEEN spleen font not found, downloading"

	mkdir /home/max/src/myfonts
	cd /home/max/src/myfonts/
	wget https://github.com/fcambus/spleen/releases/download/1.8.2/spleen-1.8.2.tar.gz
	tar -xvf ./spleen-1.8.2.tar.gz 
	cp -r /home/max/src/myfonts/spleen-1.8.2/ ~/.local/share/fonts/
  
fi

echo "check font cache? (y) enter any other key to skip"
read CHECK_CACHE
if [ "$CHECK_CACHE" = "y" ]; then

	echo "checking font cache"

	fc-cache -fv
else
	echo "skipping cache check"
fi

# *****
# configurations
# soft linking all config files
echo "linking config files"
ln -sf /home/max/src/dotfiles/bash/.bashrc ~/.bashrc
ln -sf /home/max/src/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sf /home/max/src/dotfiles/emacs/settings.org ~/.emacs.d/settings.org
ln -sf /home/max/src/dotfiles/xterm/.Xresources ~/.Xresources
ln -sf /home/max/src/dotfiles/misc/.Xmodmap ~/.Xmodmap
ln -sf /home/max/src/dotfiles/openbox/* ~/.config/openbox/
ln -sf /home/max/src/dotfiles/rofi/* ~/.config/rofi

# update configs
xrdb -merge ~/.Xresources
echo "configs updated"

# *****
# Programming environment setup

# system health checks and package updates

# MOTD and startup (maybe do this in elisp?)
