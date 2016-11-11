#!/usr/bin/env bash

## Link dictionay and files
PATHS=(`pwd` `pwd`/zshrc ~/.oh-my-zsh `pwd`/whlin.zsh-theme)
LINKS=(~/.zsh ~/.zshrc `pwd`/oh-my-zsh ~/.oh-my-zsh/themes/whlin.zsh-theme)

tLen=${#PATHS[@]}

for (( i=0; i<${tLen}; i++ ));
do
    if [[ -e ${LINKS[$i]} ]]; then
        echo "rm ${LINKS[$i]}"
        rm ${LINKS[$i]}
    else
        echo "${LINKS[$i]} doesn't exist"
    fi
done

for (( i=0; i<${tLen}; i++ ));
do
    echo "ln -s ${PATHS[$i]} ${LINKS[$i]}"
    ln -s ${PATHS[$i]} ${LINKS[$i]}
done
