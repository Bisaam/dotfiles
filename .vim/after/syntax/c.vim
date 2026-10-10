" Extra C highlighting to match bat's Catppuccin theme (see ~/.vimrc)
" (also applies to C++, whose syntax file loads this one)

" function calls and definitions: foo(...)
syn match cFunctionCall "\<\h\w*\ze\s*("
" operators; a / that starts a comment and the dot in .5 are left alone
syn match cOperatorSym "[-+*%=<>!&|^~?]\+\|/[/*]\@!\|\.\d\@!"
" commas and semicolons (brackets are left alone: c.vim uses them for
" region matching and error highlighting)
syn match cDelimiterSym "[,;]"

hi def link cFunctionCall Function
hi def link cOperatorSym  Operator
hi def link cDelimiterSym Delimiter
