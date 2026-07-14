# plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zoxide should use cd instead of z
eval "$(zoxide init --cmd cd zsh)"

# my custom Prompt
PROMPT='%F{#61AFEF}%n%F{#C678DD}@%F{#98C379}%m %F{#98C379}%~ %F{#FFFFFF}%%%f '

# my Path variable
export PATH="$PATH:/Users/bisaam/dev/projects/neofetch"

# binds
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" kill-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^H" backward-kill-word

# history opts
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="$XDG_CACHE_HOME/zsh_history" # move histfile to cache
HISTCONTROL=ignoreboth # consecutive duplicates & commands starting with space are not saved


# fzf setup
source <(fzf --zsh) # allow for fzf history widget

# aliases
alias ..="cd .."
alias ls="eza -l --icons"
alias la="eza -la --icons"
alias .="printf '\U000F17A9 ' && pwd"
alias cat="bat"
alias df="dysk"
alias rm="rm -i"

