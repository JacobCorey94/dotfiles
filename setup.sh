#!/bin/bash

cd "$(dirname "$0")"

# No root allowed
if [ "$EUID" == 0 ]; then
	echo "Don't run this as root"
	exit 1
fi

# We're going to assume that /etc/os-release exists
# More can be added
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	OS=$NAME
else
	echo "Error: OS Unknown; cannot find \$NAME in /etc/os-release"
	exit
fi

case $OS in
	Ubuntu | "Kali GNU/Linux")
		sudo apt update && sudo apt install vim tmux python3 python3-pip socat -y
		pip install psutil
		pip install powerline-status
		sudo apt install powerline zoxide -y
		python="python3"
		;;
	*)
		echo "Error: OS not recognized"
		exit 1
esac

# Install misc.
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
curl -sS https://starship.rs/install.sh | sh

# Copy powerline files over
pythonVersion=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
powerlineDirectory="${HOME}/.local/lib/python${pythonVersion}/site-packages/powerline"
cp -r powerline/* ${powerlineDirectory}/config_files

# Move dotfiles
cp -v bashrc ~/.bashrc
cp -v tmux.conf ~/.tmux.conf
cp -v vimrc ~/.vimrc

cd $HOME

# Amend bashrc
echo -e "\n### Powerline ###\n\n" >> .bashrc
echo -e "# Loads the powerline PS1 as a daemon for quick reloading, but ONLY in tmux\n# if [ \$TMUX ]; then" >> .bashrc
echo -e "#\\tpowerline-daemon -q\n#\\tPOWERLINE_BASH_CONTINUATION=1\n#\\tPOWERLINE_BASH_SELECT=1" >> .bashrc
echo -e "#\\t. ${powerlineDirectory}/bindings/bash/powerline.sh\n# fi\n" >> .bashrc
echo -e "# Alternatively, if you always want powerline, uncomment this instead:\n# powerline-daemon -q" >> .bashrc
echo -e "#POWERLINE_BASH_CONTINUATION=1\n#POWERLINE_BASH_SELECT=1\n#. ${powerlineDirectory}/bindings/bash/powerline.sh" >> .bashrc
echo -e "export PATH=\"\$HOME/.local/share:\$PATH\"" >> .bashrc
echo -e "\n# Zoxide\neval \"\$(zoxide init bash)\"" >> .bashrc
echo -e "\n# Starship Prompt\neval \"\$(starship init bash)\"" >> .bashrc

# Install vimplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Amend vimrc
echo -e "\n\nset rtp+=$powerlineDirectory/bindings/vim/\n" >> .vimrc
echo -e "\" Always show statusline\nset laststatus=2" >> .vimrc

# Configure plugins
vim +'PlugInstall --sync' +qa

# Amend tmux.conf
echo -e "\n\n# Standard powerline plugin\nsource \"$powerlineDirectory/bindings/tmux/powerline.conf\"\n" >> .tmux.conf
echo -e "set -g default-terminal \"tmux-256color\"\nset -g terminal-overrides ',xterm-256color:Tc'" >> .tmux.conf
echo -e "\n# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)\n# run '~/.tmux/plugins/tpm/tpm'" >> .tmux.conf