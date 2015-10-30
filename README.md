# whlin's zshrc setting

## Preface

請先完成 rc 的環境設置 請參考 [rc]

##  Installation

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

3. 進入 ~/Document/rc , 將vimfilers git clone 進來

```sh
$ cd ~/Document/rc
$ git clone https://github.com/whlin/zshrc.git
```

4. 進入 zshrc 資料夾, 執行 install_unix.sh

```sh
$ cd zshrc
$ ./install_unix.sh
```

## local rc_files 目錄設置

在家目錄, 創建 rc_files 資料夾, 並將 vimfilers 檔案 git clone 進去

```sh
$ mkdir rc_files
$ cd ~/rc_files
$ git clone https://github.com/whlin/zshrc.git
```


[rc]: <https://github.com/whlin/rc>
