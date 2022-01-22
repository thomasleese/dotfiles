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

# Fish
pushd fish
rm -rf ~/.config/fish
mkdir -p ~/.config/fish
ln -s $(pwd) ~/.config/fish/conf.d
echo '/usr/local/bin/fish' | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/fish $USER
popd

# Poetry
curl -sSL https://install.python-poetry.org | python3 -
mkdir -p ~/.config/fish/completions
$(python3 -c 'import site; print(site.getuserbase())')/bin/poetry completions fish > ~/.config/fish/completions/poetry.fish

# Asdf
pushd asdf
ln -s $(pwd)/asdfrc ~/.asdfrc
asdf plugin add java
asdf plugin add kotlin
asdf plugin add nodejs
asdf plugin add python
asdf plugin add ruby
popd
