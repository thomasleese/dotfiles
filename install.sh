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
ln -s $(pwd) ~/.config/fish/conf.d
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/fish $USER
popd

# Poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

# Asdf
pushd asdf
ln -s $(pwd)/asdfrc ~/.asdfrc
asdf plugin add python
asdf plugin add ruby
asdf plugin add nodejs
popd
