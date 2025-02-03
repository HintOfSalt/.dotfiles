# My dotfiles

## Requirements

Ensure you have the following installed on your system

### Git

```
$ sudo apt install git
```

### Stow

```
$ sudo apt install stow
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

Install zsh plugins

```
$ git clone git@github.com/zsh-users/zsh-autosuggestions.git $ZSH/zsh-autosuggestions
$ git clone git@github.com/zdharma-continuum/fast-syntax-highlighting.git $ZSH/fast-syntax-highlighting
$ git clone git@github.com/zsh-users/zsh-completions.git $ZSH/zsh-completions
$ git clone --depth=1 git@github.com/romkatv/powerlevel10k.git $ZSH/powerlevel10k
```

Install Tmux plugins

```
$ git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$ tmux
```
Then prefix-I
