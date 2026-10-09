# defining compinit
autoload -Uz compinit
compinit

# zsh plugins
source $HOME/dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/plugins/macos/macos.plugin.zsh
# source $HOME/dotfiles/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# load zsh modules
zmodload zsh/complist #zsh completion list feature
autoload -U compinit && compinit #enables zsh tab completion
autoload -U colors && colors #enables easy colors variables

# zsh tetris setup
autoload -U tetris 
zle -N tetris
bindkey '^X^T' tetris # ctrl x + ctrl t to play tetrix

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS # don't save duplicate commands
setopt HIST_IGNORE_SPACE # don't save commands that starts with a space

# zoxide should use cd instead of z
eval "$(zoxide init --cmd cd zsh)"

# My custom Prompt
# Catppuccin Mocha colors, same layout as starship (fallback if starship isn't loaded)
PROMPT=$'%F{#89B4FA}┌──(%n%F{#CBA6F7}@%F{#A6E3A1}%m%F{#89B4FA})-[%F{#A6E3A1}%~%F{#89B4FA}]\n%F{#89B4FA}└─%(?.%F{#CDD6F4}.%F{#F38BA8})$%f '

# my Path variable
export PATH="$PATH:$HOME/Library/Python/3.9/bin:$HOME/.local/bin:/opt/metasploit-framework/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin"

# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word

# no vim mode 
bindkey -e

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved


# aliases
alias ..="cd .."
alias ls="eza -l --icons=auto"
alias la="eza -la --icons=auto"
alias .="printf '\U000F17A9 ' && pwd"
#alias cat="bat"
#alias df="dysk"
alias rm="rm -i"
alias path="echo $PATH | tr : '\n'"
alias e="exit"
alias tls="tmux ls"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"



# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# Starship startup
eval "$(starship init zsh)"

