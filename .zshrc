source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zoxide should use cd instead of z
eval "$(zoxide init --cmd cd zsh)"

# My custom Prompt
PROMPT='%F{#61AFEF}%n%F{#C678DD}@%F{#98C379}%m %F{#98C379}%~ %F{#FFFFFF}%%%f '

# My Path variable
export PATH="$PATH:/Users/bisaam/dev/projects/neofetch"

# Aliases
alias ..="cd .."
alias ls="eza -l --icons"
alias la="eza -la --icons"

