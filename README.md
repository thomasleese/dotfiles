# Dotfiles

This repository contains configuration for the CLI tools that I use. It is
designed to be used in parallel with my Ansible configuration held in the
[machines repository][].

[machines repository]: https://github.com/thomasleese/machines

## Installation

To install the configuration files, you can use the `stow` command:

```shell
stow -t $HOME fish git
```

## Dependencies

- [Stow](https://www.gnu.org/software/stow/)
- [Fish](https://fishshell.com/)
- [Starship](https://starship.rs/)
