#!/usr/bin/env bash

## Link dictionay and files
ZSHRCHOME=$HOME/Documents/zshrc
CLEAN=false
PATHS=($ZSHRCHOME $HOME/.zshsetting/zshrc $HOME/.zshsetting/oh-my-zsh $HOME/.zshsetting/whlin.zsh-theme)
LINKS=($HOME/.zshsetting $HOME/.zshrc $HOME/.oh-my-zsh $HOME/.oh-my-zsh/themes/whlin.zsh-theme)

tLen=${#PATHS[@]}

cleanRCFiles (){
    for (( i=0; i<${tLen}; i++ ));
    do
        if [[ -e ${LINKS[$i]} ]]; then
            echo "rm -rf ${LINKS[$i]}"
            rm -rf ${LINKS[$i]}
        else
            echo "${LINKS[$i]} doesn't exist"
        fi
    done
}

buildRCFiles (){
    for (( i=0; i<${tLen}; i++ ));
    do
        echo "ln -s ${PATHS[$i]} ${LINKS[$i]}"
        ln -s ${PATHS[$i]} ${LINKS[$i]}
    done
}

while getopts c: opt
do
    case $opt in
        c) CLEAN=$OPTARG;;
        \?) echo "Invalid option -$OPTARG" >&2;;
    esac
done
    
# Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone --recursive https://github.com/robbyrussell/oh-my-zsh

if [[ ! -e $ZSHRCHOME ]]; then
    git clone https://github.com/whlin/zshrc $ZSHRCHOME
fi

echo "----- CLEAN -----"
cleanRCFiles

if [[ "${CLEAN}" != true ]]; then
    echo "----- BUILD -----"
    buildRCFiles
fi

