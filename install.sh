#!/usr/bin/env bash

# cd /etc/vim; vim vimrc; let mapleader=","

if [ $1 = "install" ];then
    echo "install...";
    cp ./vimrc ../
    cp ./filetype.vim ../
    cp ./myspacevim.vim ../autoload/
    cp ./init.toml ../../.SpaceVim.d/
    cp ./.ycm_extra_conf.py ../
elif [ $1 = "back" ]; then
    echo "backing..."
    cp ../vimrc ./
    cp ../filetype.vim ./
    cp ../autoload/myspacevim.vim ./
    cp ../../.SpaceVim.d/init.toml ./
    cp ../.ycm_extra_conf.py ./
fi



