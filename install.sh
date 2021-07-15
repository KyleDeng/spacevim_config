#!/usr/bin/env bash

# 插件安装位置 ~/.cache/vimfiles/repos/github.com
# cd /etc/vim; vim vimrc; let mapleader=","
# sudo apt-get install font-manager

if [ $1 = "install" ];then
    echo "install...";
    cp ./vimrc ../
    cp ./filetype.vim ../
    cp ./myspacevim.vim ../autoload/
    cp ./init.toml ../../.SpaceVim.d/
    cp ./.ycm_extra_conf.py ../
    cp ./.editorconfig ../
elif [ $1 = "back" ]; then
    echo "backing..."
    cp ../vimrc ./
    cp ../filetype.vim ./
    cp ../autoload/myspacevim.vim ./
    cp ../../.SpaceVim.d/init.toml ./
    cp ../.ycm_extra_conf.py ./
    cp ../.editorconfig ./
fi



