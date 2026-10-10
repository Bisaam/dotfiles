" Extra zsh highlighting to match bat's Catppuccin theme (see ~/.vimrc)

" bat colors commands blue but export and return like keywords; zsh.vim puts
" them in zshCommands with every other builtin
syn keyword zshDeclareKeyword export return

hi def link zshDeclareKeyword Keyword
