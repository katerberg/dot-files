#!/bin/bash
error=0

#Git config
cp gitconfig ~/.gitconfig

#bash config
cp bashrc ~/.bashrc

#tmux
cp tmux.conf ~/.tmux.conf

#jshint
cp jshintrc ~/.jshintrc

#conky
sudo setcap cap_net_raw,cap_net_admin=eip /usr/bin/conky
sudo chmod u+s /usr/sbin/hddtemp
cp -r conky ~/.conky

#git
git config user.email "katerberg@fastmail.fm"
git config user.name "Katerberg"

#dictionary
cp dictionary ~/.dictionary

#tint2restart
sudo cp tint2restart /usr/bin/tint2restart
sudo chmod 755 /usr/bin/tint2restart

#npm
sudo npm install -g karma karma-cli bower

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
cp bin/convert.sh ~/bin/convert.sh

exit 0
