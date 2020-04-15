> Mac Vim编辑环境

前期准备工作：
1、安装vendle 
mkdir ~/.vim/bundle && git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

2、开始安装Vim
1. brew install vim
2. cp ./.vimrc  ~/
3. vim ~/.vimrc 
4. vim> PluginInstall

> Win vim
1. 复制.vimrc.win 到当前用户文件夹下的文件 vimrc
2. menu.bat 生成右键快捷编辑菜单
