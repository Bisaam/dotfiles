" Extra zsh highlighting to match bat's Nord theme (see ~/.vimrc)

" bat colors commands like functions but export and return like keywords;
" zsh.vim puts them in zshCommands with every other builtin
syn keyword zshDeclareKeyword export return

hi def link zshDeclareKeyword Keyword
