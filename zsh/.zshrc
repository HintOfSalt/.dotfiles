export PATH=$HOME/.local/bin:$HOME/bin:/usr/local/bin:$PATH
export ZSH=$HOME/.zsh

### ---- history ----
export HISTFILE=$ZSH/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY

### ---- plugins ----
source $ZSH/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
source $ZSH/plugins/zsh-autosuggestions-master/zsh-autosuggestions.zsh
fpath=($ZSH/plugins/zsh-completions/src $fpath)

### ---- prompt ----
source $ZSH/themes/powerlevel10k/powerlevel10k.zsh-theme

### ---- dev ----
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
