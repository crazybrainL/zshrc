#!/usr/bin/env bash

ZSHRCHOME=~/Documents/zshrc

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

if [[ ! -e $ZSHRCHOME ]]; then
    git clone https://github.com/whlin/zshrc $ZSHRCHOME
fi

## Link dictionay and files
PATHS=($ZSHRCHOME $ZSHRCHOME/zshrc ~/.oh-my-zsh $ZSHRCHOME/whlin.zsh-theme)
LINKS=(~/.zsh ~/.zshrc $ZSHRCHOME/oh-my-zsh ~/.oh-my-zsh/themes/whlin.zsh-theme)

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
