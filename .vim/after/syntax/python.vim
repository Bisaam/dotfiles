" Extra Python highlighting to match bat's Nord theme (see ~/.vimrc)

" function and method calls: foo(), obj.bar()
syn match pythonFunctionCall "\<\h\w*\ze\s*("
" operators, and the dot in obj.attr (but not in .5 or ...)
syn match pythonOperatorSym "[-+*/%=<>!&|^~]\+\|\.\%(\.\|\d\)\@!"
" commas, semicolons and the -> before return types. bat leaves brackets and
" the colon that opens a block in plain text, so those aren't matched here
syn match pythonDelimiterSym "[,;]\|->"
" ALL_CAPS names are constants
syn match pythonConstantName "\<\u[A-Z0-9_]\+\>"
" builtin types are keywords, other builtins (print, len, range) are functions
syn keyword pythonBuiltinType bool bytearray bytes complex dict float frozenset int list object set str tuple type
" True/False/None are plain constants -- redefine so they win over pythonBuiltin
syn keyword pythonBuiltinConstant True False None NotImplemented Ellipsis __debug__
" base classes are colored like the class name: class Point(Base, metaclass=Meta);
" keyword args like metaclass= stay plain. Not a contained match, since
" python.vim's ALLBUT regions (f-string fields) would pick it up anywhere.
syn match pythonClassBase "\%(\<class\s\+\h\w*\s*([^)]*\)\@<=\<\h\w*\>\%(\s*=\)\@!"

" docstrings: a triple-quoted string that is a statement by itself
syn region pythonDocstring start=+^\s*\zs[rRuU]\=\z('''\|"""\)+ end=+\z1+ keepend contains=pythonEscape,@Spell

hi def link pythonFunctionCall    Function
hi def link pythonOperatorSym     Operator
hi def link pythonDelimiterSym    Delimiter
hi def link pythonDocstring       Comment
hi def link pythonConstantName    Constant
hi def link pythonBuiltinType     Keyword
hi def link pythonBuiltinConstant Constant
hi def link pythonClassBase       pythonClass
