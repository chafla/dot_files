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


