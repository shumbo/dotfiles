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
ln -sf ${SHARED_DIR}/.vim ${HOME_DIR}/.vim

# fish configuration
if [ ! -d "$FISH_DIR" ]; then
  echo "=> Ensure Fish Directories Exist"
  mkdir -p ${FISH_DIR}
  echo "=> Symlink Fish Configuration"
  ln -sf ${PLATFORM_DIR}/fish/config.fish ${FISH_DIR}/config.fish
  ln -sf ${PLATFORM_DIR}/fish/aliases.fish ${FISH_DIR}/aliases.fish
  ln -sf ${SHARED_DIR}/fish/fishfile ${FISH_DIR}/fishfile
  sudo ln -sf ${SHARED_DIR}/fish/functions ${FISH_DIR}/functions
  sudo ln -sf ${SHARED_DIR}/fish/conf.d ${FISH_DIR}/conf.d
  sudo ln -sf ${SHARED_DIR}/fish/completions ${FISH_DIR}/completions
else
  echo "=> Skipping Fish Configuration as ~/.config/fish exists"
fi

# visual studio code
echo "=> Symlink Visual Studio Configuration"
ln -sf ${SHARED_DIR}/vscode/settings.json "${HOME_DIR}/Library/Application Support/Code/User/settings.json"
