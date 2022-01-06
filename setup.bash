#!/bin/bash
# Set up the dot files. Copy our current files to the directories where they belong.

echo "Configuring vim"
if [ ! -d "~/.vim" ]; then
	mkdir ~/.vim
fi

cp vimrc ~/.vim/.vimrc

# update our vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim -c 'PluginInstall' -c 'qa!'

# Create a shortcut to make editing easier
ln -s ~/.vim/.vimrc ~/.vimrc
cp -r colors ~/.vim/colors

echo "Installing fzf"

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

read -p "Add bashrc options? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	cat bashrc > ~/.bashrc
	source ~/.bashrc
fi

# powerline stuff

echo "Setting up powerline stuff"

if [[ $(grep Microsoft /proc/version) ]]; then
	echo "I see you're on WSL, You probably want to install the Cascadia powerline font if you haven't already."
fi

sudo apt install -y python3 python3-pip
pip3 install --user powerline-status

cat > ~/.bashrc <<- EOM
# -- START POWERLINE --

# Add this to your PATH if it’s not already declared
export PATH=$PATH:$HOME/.local/bin

# Powerline configuration
if [ -f $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh ]; then
    $HOME/.local/bin/powerline-daemon -q
    POWERLINE_BASH_CONTINUATION=1
    POWERLINE_BASH_SELECT=1
    source $HOME/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
fi

# -- END POWERLINE
EOM

