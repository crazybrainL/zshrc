#!/usr/bin/env bash

## install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

## Link dictionay and files
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc 
ln -s ~/.oh-my-zsh `pwd`/oh-my-zsh
cp ./whlin.zsh-theme ./oh-my-zsh/themes/
