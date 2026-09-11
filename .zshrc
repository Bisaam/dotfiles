# defining compinit
autoload -Uz compinit
compinit

# plugins
source $HOME/dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/plugins/macos/macos.plugin.zsh
# source $HOME/dotfiles/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh


# zoxide should use cd instead of z
eval "$(zoxide init --cmd cd zsh)"

# my custom Prompt
PROMPT='%F{#61AFEF}%n%F{#C678DD}@%F{#98C379}%m %F{#98C379}%~ %F{#FFFFFF}%%%f '

# my Path variable
export PATH="$PATH:$HOME/dev/projects/neofetch:$HOME/Library/Python/3.9/bin:/opt/homebrew/lib/ruby/gems/4.0.0/bin"

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
alias cat="bat"
alias df="dysk"
alias rm="rm -i"
alias path="echo $PATH | tr : '\n'"
alias e="exit"
alias tls="tmux ls"
alias ta="tmux attach -t"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
