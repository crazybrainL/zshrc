#!/usr/bin/env bash

## Link dictionay and files
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc 
ln -s ~/.oh-my-zsh `pwd`/oh-my-zsh
ln -s `pwd`/whlin.zsh-theme `pwd`/oh-my-zsh/themes/whlin.zsh-theme

#cp ./whlin.zsh-theme ./oh-my-zsh/themes/
