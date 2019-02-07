#!/bin/bash
# Set up the dot files. Copy our current files to the directories where they belong.

if [ ! -d "~/.vim" ]; then
	mkdir ~/.vim
fi

cp vimrc ~/.vim/.vimrc

# update our vimrc

vim -c 'PluginInstall' -c 'qa!'

# Create a shortcut to make editing easier
ln -s ~/.vim/.vimrc ~/.vimrc

cp -r colors ~/.vim/colors

cp ssh_config ~/.ssh/config

# Append the bashrc to the bottom of the current bashrc

bashrc >> ~/.bashrc

