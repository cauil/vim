# My vim and sh setting for daily use

## 0. Prerequire

+   Nvm

    Please use nvm to manage node. Don't use n.
    
    If u have install node before use nvm. Uninstall the global node and the packages.

    ```
    sudo rm -rf /usr/local/lib/node_modules
    sudo rm /usr/local/bin/node
    /local/bin && ls -l | grep "../lib/node_modules/" | awk '{print $9}'| xargs rm
    ```

+   Node
    



## 1. VIM
### Install

1.Clone vim:

    $ git clone git@github.com:cauil/vim.git ~/.vim

2.Install
    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    $ cd ~/.vim
    $ vim (:PlugInstall)
    $ ln -s vimrc ~/.vimrc && ln -s tern-project ~/.tern-project
    $ npm install -g eslint jshint instant-markdown-d

3.install [homebrew](http://brew.sh/)

note: install [homebrew](http://brew.sh/), maybe some problems, look at [here](https://segmentfault.com/a/1190000003817086)

    $ brew install cmake
    $ brew install the_silver_searcher

4.Build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation).

note: 

    $ cd ~/.vim/bundle/YouCompleteMe
    $ python3 install.py --clangd-completer --ts-completer --tern-completer

### Manage Plugin

in vim command model

1. update

    `:PlugUpdate`
2. clean the plugin not used more

    `:PlugClean`
3. list all plugins

    `:PlugList`
4. find plugin

    `:PlugSearch`

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

* ⌃ + u：clear current line
* ⌃ + a：move to head of line
* ⌃ + e：move to tail of line
* ⌃ + f：move forward
* ⌃ + b：move back
* ⌃ + p：pre command
* ⌃ + n：next command
* ⌃ + r：search history commadn
* ⌃ + y：recove the lastest delete word
* ⌃ + h：delete the character before cursor
* ⌃ + d：delete the character on cursor
* ⌃ + w：delete the word before cursor
* ⌃ + k：delete the content from cursor to tail of line
* ⌃ + t：switch character between before and on the cursor

## 3. pip + virtual

### pip

1.install

[download get-pip.py](https://pip.pypa.io/en/stable/installing/), then run the following:

    python get-pip.py

2.How to Use

please look [this document](https://pip.pypa.io/en/stable)

### virtualenvwrapper

1.install

    pip install virtualenvwrapper

in OSX 10.11 El Capitan there is a error when install(becasue the dep package six), so u can:

    sudo pip install virtualenvwrapper --ignore-installed six

2.config

add this to .profile or .bashrc, because i use zsh, os i just put it in .myzshrc:

    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/Devel
    source /usr/local/bin/virtualenvwrapper.sh

3.manage 

please look [this document](https://virtualenvwrapper.readthedocs.io/en/latest/command_ref.html#managing-environments)

    workon, mkvirtualenv, deactive, rmvirtualenv

4.use different python verison

when mkvirtualenv, just:

    mkvirtualenv -p /usr/local/bin/python3 env1
