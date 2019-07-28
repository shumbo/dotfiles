#!/bin/bash -e

# ensure empty directories return null
shopt -s nullglob

# configuration directories
HOME_DIR=$1
PLATFORM_DIR=$(pwd)
SHARED_DIR=$(pwd)/../shared
FISH_DIR=${HOME_DIR}/.config/fish

echo "----------------------------------------------"
echo "=> Home Directory: $HOME_DIR"
echo "=> Platform Directory: $PLATFORM_DIR"
echo "=> Shared Directory: $SHARED_DIR"
echo "=> Fish Directory: $FISH_DIR"
echo "----------------------------------------------"

# git config
echo "=> Symlink Git Configuration"
ln -sf ${SHARED_DIR}/.gitattributes ${HOME_DIR}/.gitattributes
ln -sf ${SHARED_DIR}/.gitconfig ${HOME_DIR}/.gitconfig
ln -sf ${SHARED_DIR}/.gitignore ${HOME_DIR}/.gitignore
ln -sf ${SHARED_DIR}/.gitmodules ${HOME_DIR}/.gitmodules

# vim config
echo "=> Symlink Vim Configuration"
ln -sf ${SHARED_DIR}/.vimrc ${HOME_DIR}/.vimrc

# fish configuration
echo "=> Symlink Fish Configuration"
sudo ln -Fsv ${PLATFORM_DIR}/fish ${FISH_DIR}
fisher # restore fisher plugins

# visual studio code
echo "=> Symlink Visual Studio Configuration"
ln -sf ${SHARED_DIR}/vscode/settings.json "${HOME_DIR}/Library/Application Support/Code/User/settings.json"
