#!/bin/sh

set -eu

# Brew
pushd brew
brew bundle
popd

# Git
pushd git
rm -f ~/.gitconfig ~/.gitignore
ln -s $(pwd)/gitignore ~/.gitignore
ln -s $(pwd)/gitconfig ~/.gitconfig
popd

# Fish
pushd fish
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
sudo chsh -s /opt/homebrew/bin/fish $USER
rm -rf ~/.config/fish/conf.d
mkdir -p ~/.config/fish
ln -s $(pwd) ~/.config/fish/conf.d
popd

# Mise
mise use -g usage
mise completion fish > ~/.config/fish/completions/mise.fish
