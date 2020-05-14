#!/bin/bash

HOME_DIR=$1
PLATFORM_DIR=$(pwd)
SHARED_DIR=${PLATFORM_DIR}/../shared

touch ${HOME_DIR}/.bash_profile

export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

brew update && brew upgrade
brew tap homebrew/cask-versions
brew tap homebrew/cask-drivers
brew tap homebrew/cask-fonts

# install cli tools
brew install \
  curl \
  bash \
  fish \
  git \
  vim \
  tree \
  openssl \
  httpie \
  wget \
  starship

# TODO: install more languages

# install applications
brew cask install \
  cyberduck \
  visual-studio-code \
  alfred \
  transmission \
  google-chrome \
  slack \
  sequel-pro \
  bartender \
  google-japanese-ime

brew update && brew cleanup && brew cleanup

# install code extensions
code --install-extension Angular.ng-template
code --install-extension bungcip.better-toml
code --install-extension codezombiech.gitignore
code --install-extension dbaeumer.vscode-eslint
code --install-extension esbenp.prettier-vscode
code --install-extension harg.iceberg
code --install-extension mikestead.dotenv
code --install-extension ms-azuretools.vscode-docker
code --install-extension ms-python.python
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode-remote.remote-ssh-edit
code --install-extension ms-vscode-remote.remote-ssh-explorer
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.vscode-typescript-tslint-plugin
code --install-extension octref.vetur
code --install-extension pnp.polacode
code --install-extension robinbentley.sass-indented
code --install-extension sgryjp.japanese-word-handler
code --install-extension skyapps.fish-vscode
code --install-extension tomoki1207.pdf
code --install-extension xaver.clang-format

# install fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
