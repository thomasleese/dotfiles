#!/bin/sh

set -eu

# Brew
pushd brew
brew bundle
popd

# Git
pushd git
rm ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
popd

# Fish
pushd fish
rm -r ~/.config/fish
mkdir -p ~/.config/fish
ln -s $(pwd)/conf.d ~/.config/fish/conf.d
fish setup.fish
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/fish $USER
popd

# Atom
pushd atom
rm -r ~/.atom
mkdir -p ~/.atom
ln -s $(pwd)/config.cson ~/.atom/config.cson
popd

# Poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
