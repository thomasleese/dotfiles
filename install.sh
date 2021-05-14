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
rm -rf ~/.config/fish
mkdir -p ~/.config/fish
ln -s $(pwd)/conf.d ~/.config/fish/conf.d
fish setup.fish
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/fish $USER
popd

# Sublime Text
pushd sublime-text
rm -rfv ~/Library/Application\ Support/Sublime\ Text/Packages/User
mkdir -p ~/Library/Application\ Support/Sublime\ Text/Packages
ln -s $(pwd) ~/Library/Application\ Support/Sublime\ Text/Packages/User
popd

# Sublime Merge
pushd sublime-merge
rm -rfv ~/Library/Application\ Support/Sublime\ Merge/Packages/User
mkdir -p ~/Library/Application\ Support/Sublime\ Merge/Packages
ln -s $(pwd) ~/Library/Application\ Support/Sublime\ Merge/Packages/User
popd

# Poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
