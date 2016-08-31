# My vim and sh setting for daily use

## 0. Prerequire

+    [Node](https://nodejs.org/en/)

## 1. VIM
### Install

1.Clone vim:

    $ git clone git@github.com:cauil/vim.git ~/.vim

2.Install

    $ cd ~/.vim
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    $ ln -s vimrc ~/.vimrc && ln -s tern-project ~/.tern-project
    $ vim +BundleInstall +qall
    $ npm install -g eslint jshint instant-markdown-d

3.install [homebrew](http://brew.sh/)

note: install [homebrew](http://brew.sh/), maybe some problems, look at [here](https://segmentfault.com/a/1190000003817086)

    $ brew install cmake

4.Build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation).

note: 

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --tern-completer --clang-completer

### Manage Plugin

in vim command model

1. update

    `:BundleUpdate`
2. clean the plugin not used more

    `:BundleClean`
3. list all plugins

    `:BundleList`
4. find plugin

    `:BundleSearch`

## 2. ITREM + ZSH

### install

1. download [iterm 2](http://www.iterm2.com/) and the color [solarized](http://ethanschoonover.com/solarized)

2. install [oh-my-zsh](http://ohmyz.sh)

3. change sh

    $ chsh -s /bin/zsh

    $ vim ~/.myzshrc

add:

`export CLICOLOR=1`

`export LSCOLORS=dxfxcxdxbxegedabagacad`

### iterm use

* ⌃ + u：清空当前行
* ⌃ + a：移动到行首
* ⌃ + e：移动到行尾
* ⌃ + f：向前移动
* ⌃ + b：向后移动
* ⌃ + p：上一条命令
* ⌃ + n：下一条命令
* ⌃ + r：搜索历史命令
* ⌃ + y：召回最近用命令删除的文字
* ⌃ + h：删除光标之前的字符
* ⌃ + d：删除光标所指的字符
* ⌃ + w：删除光标之前的单词
* ⌃ + k：删除从光标到行尾的内容
* ⌃ + t：交换光标和之前的字符

## 3. pip + virtual

### pip

1. install

[download get-pip.py](https://pip.pypa.io/en/stable/installing/), then run the following:

    python get-pip.py

2. How to Use

please look [this document](https://pip.pypa.io/en/stable)

### virtualenvwrapper

1. install

    pip install virtualenvwrapper

in OSX 10.11 El Capitan there is a error when install(becasue the dep package six), so u can:

    sudo pip install virtualenvwrapper --ignore-installed six

2. config

add this to .profile or .bashrc, because i use zsh, os i just put it in .myzshrc:

    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Devel
    source /usr/local/bin/virtualenvwrapper.sh

3. manage 

please look [this document](https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html#managing-environments)

    workon, mkvirtualenv, deactive, rmvirtualenv

4. use different python verison

when mkvirtualenv, just:

    mkvirtualenv -p /usr/local/bin/python3 env1
