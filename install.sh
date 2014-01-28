#/usr/bin/env bash

#########################################
# Following packages are REQUIRED:
#   1. vim7.4
#   2. cmake
#   3. build-essential
#   4. python-dev
########################################

if [ -f ~/.vimrc ]; then
    echo "please make backup of your current ~/.vimrc and remove it"
    exit 1
fi
if [ -d ~/.vim ]; then
    echo "please make backup of your current ~/.vim directory and remove it"
    exit 1
fi

root=`realpath .`

cd ~/
ln -s $root/.vimrc
ln -s $root/.vim
cd $root

cd .vim/bundle/
tar xf plugins.tar
echo "" | vim -c :BundleInstall! -c :qa!
cd YouCompleteMe
git submodule update --init --recursive
./install.sh --clang-completer
cd $root

echo "===All done!==="
