#!/usr/bin/env bash
# small cli to help manage linux system

# *****
# packages
# get PPAs

# tmux
# emacs
# rofi

# *****
# fonts (download terminus, spleen and hack)
FONT_SPLEEN=/home/max/src/myfonts/spleen-1.8.2
if  [ -d "$FONT_SPLEEN" ]; then

	echo "spleen font already downloaded"

else

	echo "$FONT_SPLEEN spleen font not found, downloading"

	cd /home/max/src/myfonts/
	wget https://github.com/fcambus/spleen/releases/download/1.8.2/spleen-1.8.2.tar.gz
	tar -xvf ./spleen-1.8.2.tar.gz 
	cp -r ./spleen ~/.local/share/fonts/
  
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

# system health checks

# MOTD and startup (maybe do this in elisp?)
