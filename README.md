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
    $ vim +BundleInstall +qall
    $ npm install -g eslint_d instant-markdown-d

3.install [homebrew](http://brew.sh/)

note: install [homebrew](http://brew.sh/), maybe some problems, look at [here](https://segmentfault.com/a/1190000003817086)

    $ brew install cmake

4.Build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation).

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
