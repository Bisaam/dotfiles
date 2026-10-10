# defining compinit
autoload -Uz compinit
compinit

# zsh plugins
source $HOME/dotfiles/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/dotfiles/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/dotfiles/plugins/macos/macos.plugin.zsh
# source $HOME/dotfiles/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# command-line highlighting like Kali Linux: valid commands green, unknown ones
# underlined, existing files bold, brackets colored by nesting level
# (named colors come from the iTerm Catppuccin palette)
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[path]=bold
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]='fg=#9399B2'   # Kali uses black,bold, which is nearly invisible on Catppuccin
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

# load zsh modules
zmodload zsh/complist #zsh completion list feature
autoload -U compinit && compinit #enables zsh tab completion
autoload -U colors && colors #enables easy colors variables

# completion like Kali: arrow-key menu, case-insensitive, colored, grouped
zstyle ':completion:*:*:*:*:*' menu select           # tab twice to pick with arrow keys
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # "doc<tab>" finds Documents
zstyle ':completion:*' list-colors ''                # color files and dirs in the list
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete
zstyle ':completion:*' format 'Completing %d'        # header above each group
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' rehash true                   # see newly installed commands right away
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,command'

# no vim mode (must come before the binds below, or switching keymaps drops them)
bindkey -e

# zsh tetris setup
autoload -U tetris 
zle -N tetris
bindkey '^X^T' tetris # ctrl x + ctrl t to play tetrix

# history
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_history" # histfile lives in cache
setopt HIST_IGNORE_DUPS # don't save duplicate commands
setopt HIST_IGNORE_SPACE # don't save commands that starts with a space
setopt SHARE_HISTORY # write each command immediately and share it between open terminals
setopt HIST_EXPIRE_DUPS_FIRST # trim duplicates first when the history is full
setopt HIST_VERIFY # show the expanded !!, !$, etc. before running it
setopt INTERACTIVE_COMMENTS # allow # comments at the prompt

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
# keys like Kali
bindkey ' ' magic-space                 # expand !! and !$ as you press space
bindkey '^[[1;5C' forward-word          # ctrl + right
bindkey '^[[1;5D' backward-word         # ctrl + left
bindkey '^[[3;5~' kill-word             # ctrl + delete
bindkey '^[[3~' delete-char             # delete
bindkey '^[[H' beginning-of-line        # home
bindkey '^[[F' end-of-line              # end
bindkey '^[[Z' undo                     # shift + tab undoes the last edit
WORDCHARS=${WORDCHARS//\/}              # word jumps and deletes stop at / in paths

# aliases
alias ..="cd .."
alias ls="eza -l --icons=auto"
alias la="eza -la --icons=auto"
alias .="printf '\U000F17A9 ' && pwd"
#alias cat="bat"
#alias df="dysk"
alias dysk="dysk -f 'mp <> /Volumes/Recovery'" # hide the Recovery volume
# asciiquarium on the terminal background instead of grey (see .config/asciiquarium/DefaultBg.pm)
alias asciiquarium='PERL5LIB=/opt/homebrew/opt/asciiquarium/libexec/lib/perl5:$HOME/dotfiles/.config/asciiquarium /usr/bin/perl5.34 -MDefaultBg /opt/homebrew/opt/asciiquarium/libexec/bin/asciiquarium'
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

# fzf (ctrl+t files, ctrl+r history, alt+c cd into dir, **<tab> completion)
export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --follow --exclude .git"

# Catppuccin Mocha colors
export FZF_DEFAULT_OPTS=" \
--height 40% --layout reverse --border \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A,border:#6C7086,label:#CDD6F4"

# previews: file contents with bat, directory trees with eza
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:300 {} 2>/dev/null || eza --tree --color=always --icons=auto {} | head -200'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --icons=auto {} | head -200'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'" # ? shows the full command

# use fd for **<tab> completion too
_fzf_compgen_path() { fd --hidden --follow --exclude .git . "$1" }
_fzf_compgen_dir() { fd --type d --hidden --follow --exclude .git . "$1" }

source <(fzf --zsh)

# Starship startup
eval "$(starship init zsh)"

