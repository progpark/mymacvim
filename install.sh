#!/bin/bash

echo "安装将花费一定时间，请耐心等待直到安装完成^_^"

if which apt-get >/dev/null; then
    sudo apt-get install -y vim vim-gnome ctags xclip astyle python-setuptools python-dev git
elif which yum >/dev/null; then
    sudo yum install -y gcc vim git ctags xclip astyle python-setuptools python-devel
fi

#Add HomeBrew support on  Mac OS
if which brew >/dev/null;then
    echo "You are using HomeBrew tool"
    brew install vim ctags git astyle
fi

sudo easy_install -ZU autopep8
sudo ln -s /usr/bin/ctags /usr/local/bin/ctags

mv -f ~/vim ~/vim_old
cd ~/ && git clone https://github.com/progpark/mymacvim.git
mv -f ~/.vim ~/.vim_old
mv -f ~/mymacvim ~/.vim
mv -f ~/.vimrc ~/.vimrc_old
ln -s ~/.vim/.vimrc ~/

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo "ProgPark正在努力为您安装bundle程序" > viminstall
echo "安装完毕将自动退出" >> viminstall
echo "请耐心等待" >> viminstall

vim viminstall -c "BundleInstall" -c "q" -c "q"
rm -rf viminstall
echo "安装完成"
