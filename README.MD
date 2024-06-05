# My dotfiles

## Requirements

Ensure you have the following installed on your system

### Git

```
$ sudo apt install git
```

### Stow

```
$ sudo apt install Stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:hintofsalt/.dotfiles.git
```

Then use install.sh to create symlinks

```
$ cd /.dotfiles && sudo chmod +x install.sh && ./install.sh
```
