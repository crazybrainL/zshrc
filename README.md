# whlin's zshrc setting

## Preface

本設定包含了 rc, vimfilers, zshrc 等相關環境的設定
請根據以下順序, 將相關的環境設定安裝:
    
 - [rc] 
 - [zshrc]
 - [vimfilers]

## Pre-install

1. 安裝 zsh, nvm 

```sh
$ brew install zsh zsh-completions
$ curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
$ chsh -s /bin/zsh
```

2. 安裝 oh-my-zsh

```sh
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## Installation

習慣上, 我會在 ~/Document/ 資料夾中進行安裝,
進入家目錄的 Document 資料夾, git clone the zshrc.git from github
再進入 zshrc 資料夾中, 執行 ./install_unix.sh 來進行 zshrc 檔案的設定和安裝即可.

```sh
$ cd ~/Document/rc
$ git clone https://github.com/whlin/zshrc.git
$ cd zshrc
$ ./install_unix.sh
```

[rc]: <https://github.com/whlin/rc>
[zshrc]: <https://github.com/whlin/zshrc>
[vimfilers]: <https://github.com/whlin/vimfilers>
