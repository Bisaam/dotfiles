" Extra shell highlighting to match bat's Catppuccin theme (see ~/.vimrc)

" bat colors commands blue but declarations and return like keywords; sh.vim
" puts them all in shStatement, so pull these out into their own group
syn keyword shDeclareKeyword declare export local readonly return
syn keyword shDeclareKeyword typeset skipwhite nextgroup=shSetOption
" ...and allow it everywhere shStatement is allowed (function bodies, etc.)
syn cluster shArithParenList add=shDeclareKeyword
syn cluster shCaseList       add=shDeclareKeyword
syn cluster shCommandSubList add=shDeclareKeyword
syn cluster shFunctionList   add=shDeclareKeyword
syn cluster shPPSLeftList    add=shDeclareKeyword
syn cluster shSubShList      add=shDeclareKeyword

hi def link shDeclareKeyword Keyword
