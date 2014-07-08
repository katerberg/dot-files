#!/bin/bash
error=0

#Git config
cp .gitconfig ~/.gitconfig

#bash config
cp .bashrc ~/.bashrc

#Random utility scripts
if [ ! -e ~/bin ]; then
    mkdir ~/bin
else
    if [ -d ~/bin ]; then
        echo "WARNING: ~/bin folder already exists"
    else
        echo "ERROR: ~/bin file exists and is not a folder"
        exit 1
    fi
fi
cp bin/nocaps.sh ~/bin/nocaps.sh
cp bin/sau.sh ~/bin/sau.sh

exit 0
