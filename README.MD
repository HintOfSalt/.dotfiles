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

Install OMZ plugins

```
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
$ git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Install Tmux plugins

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ tmux
```
Then prefix-I