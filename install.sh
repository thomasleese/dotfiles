#!/bin/sh

set -eu

# Brew
pushd brew
brew bundle
popd

# Git
pushd git
rm -f ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
popd

# GnuPG
pushd gnupg
mkdir -p ~/.gnupg
rm -f ~/.gnupg/gpg.conf
ln -s $(pwd)/gpg.conf ~/.gnuph/gpg.conf
popd

# Fish
pushd fish
rm -rf ~/.config/fish
mkdir -p ~/.config/fish
ln -s $(pwd) ~/.config/fish/conf.d
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/fish $USER
popd

# Asdf
pushd asdf
rm -f ~/.asdfrc
ln -s $(pwd)/asdfrc ~/.asdfrc
asdf plugin add java
asdf plugin add kotlin
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
asdf plugin add terraform
popd
