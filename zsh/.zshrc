# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### ---- path ----
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
source <(fzf --zsh)
fpath=($ZSH/zsh-completions/src $fpath)
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

### ---- prompt ----
source $ZSH/powerlevel10k/powerlevel10k.zsh-theme
export CLICOLOR=YES
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

### ---- dev ----
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

### ---- aliases ----
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
