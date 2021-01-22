#!/bin/sh

set -eu

pushd brew
brew bundle
popd

pushd git
rm ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
popd

pushd fish
rm -r ~/.config/fish
mkdir -p ~/.config/fish
ln -s $(pwd)/conf.d ~/.config/fish/conf.d
fish setup.fish
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/fish $USER
popd

pushd atom
rm -r ~/.atom
mkdir -p ~/.atom
ln -s $(pwd)/config.cson ~/.atom/config.cson
popd
