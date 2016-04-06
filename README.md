# My vim and sh setting for daily use

## 1. VIM
### Install

1.Clone vim:

    $ git clone git@github.com:cauil/vim.git ~/.vim

2.Install

    $ cd ~/.vim
    $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    $ vim +BundleInstall +qall
    $ ./install.sh

3.Build [YouCompleteMe](https://github.com/Valloric/YouCompleteMe#installation).

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

`chsh -s /bin/zsh`

note: install [homebrew](http://brew.sh/), maybe some problems, look at [here](https://segmentfault.com/a/1190000003817086)
