#!/bin/bash
cp .vimrc ~/.vimrc
mkdir -p ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo 'install success!'
