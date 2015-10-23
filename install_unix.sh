#!/usr/bin/env bash

## Link dictionay and files
rm ~/.zshrc
ln -s `pwd`/zshrc ~/.zshrc 
ln -s ~/.oh-my-zsh `pwd`/oh-my-zsh
cp ./whlin.zsh-theme ./oh-my-zsh/themes/
