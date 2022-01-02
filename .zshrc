
fpath=( "$HOME/.zfunctions" $fpath ) 

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit -i
else
  compinit -C -i
fi

zmodload -i zsh/complist

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate 

# Load antibody plugin manager https://getantibody.github.io/
source <(antibody init)

# Plugins
antibody bundle zdharma-continuum/fast-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions
antibody bundle marzocchi/zsh-notify
antibody bundle buonomo/yarn-completion

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
# https://github.com/sindresorhus/pure
prompt pure

export PATH

# History settings (sharing and sizing)
export HISTSIZE=100000
export HISTFILESIZE=100000
export SAVEHIST=100000
export HISTFILE=~/.zhistory

# Docker default platform 
export DOCKER_DEFAULT_PLATFORM=linux/amd64  

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Aliases

alias dl='docker ps -l'
alias ls='ls --color'
alias hist='history -10000 | fzf'
