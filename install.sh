#!/bin/sh

set -eu

pushd brew
brew bundle
popd

pushd git
rm ~/.gitconfig
ln -s $(pwd)/gitconfig ~/.gitconfig
popd
