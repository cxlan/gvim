#!/bin/bash
cp .vimrc ~/.vimrc
mkdir ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo 'install success!'
