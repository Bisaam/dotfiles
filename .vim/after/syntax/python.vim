" Extra Python highlighting to match bat's Catppuccin theme (see ~/.vimrc)

" function and method calls: foo(), obj.bar()
syn match pythonFunctionCall "\<\h\w*\ze\s*("
" operators, and the dot in obj.attr (but not in .5 or ...)
syn match pythonOperatorSym "[-+*/%=<>!&|^~]\+\|\.\%(\.\|\d\)\@!"
" brackets, commas, colons, and the -> before return types
syn match pythonDelimiterSym "[()\[\]{},:;]\|->"
" ALL_CAPS names are constants
syn match pythonConstantName "\<\u[A-Z0-9_]\+\>"
" builtin types are keywords, other builtins (print, len, range) are functions
syn keyword pythonBuiltinType bool bytearray bytes complex dict float frozenset int list object set str tuple type
" True/False/None are plain constants (bat leaves these upright, not italic,
" unlike the builtin functions above) -- redefine so they win over pythonBuiltin
syn keyword pythonBuiltinConstant True False None NotImplemented Ellipsis __debug__
" item access: a subscripted name, foo[...] (bat colors these maroon, like params)
syn match pythonParameter "\<\h\w*\ze\["
" keyword arguments in a call: name= with no surrounding spaces (bat: maroon).
" PEP8 top-level assignments use spaces (name = value), so those stay plain.
syn match pythonParameter "\<\h\w*\ze=[^=]"
" the object before a .method() call is blue too, but upright (not italic)
syn match pythonMethodObject "\<\h\w*\ze\.\h\w*\s*("
" parameters in a def signature are maroon italic, the way bat colors them
" (self, name, *args, **kw); defaults and annotations keep their normal colors.
" Chain a param region off the function name (def NAME( ... )).
syn match pythonFunction "\h\w*" display contained nextgroup=pythonParamRegion skipwhite
syn region pythonParamRegion matchgroup=pythonDelimiterSym start="(" end=")" contained keepend
      \ contains=pythonParamName,pythonParamDefault,pythonParamAnno,pythonDelimiterSym,pythonOperatorSym,pythonComment
" a name right after ( or , (optionally behind * / **) is a parameter
syn match pythonParamName "\%([(,]\_s*\*\{0,2}\)\@<=\h\w*" contained
" after = comes a default value, after : a type annotation -- highlight normally
syn region pythonParamDefault matchgroup=pythonOperatorSym start="=\%(=\)\@!" end="[,)]\@=" contained
      \ contains=pythonString,pythonNumber,pythonBuiltin,pythonBuiltinConstant,pythonFunctionCall,pythonMethodObject,pythonOperatorSym,pythonDelimiterSym
syn region pythonParamAnno matchgroup=pythonDelimiterSym start=":" end="[,)=]\@=" contained
      \ contains=pythonBuiltinType,pythonClass,pythonType,pythonOperatorSym,pythonDelimiterSym,pythonString

" docstrings: a triple-quoted string that is a statement by itself
syn region pythonDocstring start=+^\s*\zs[rRuU]\=\z('''\|"""\)+ end=+\z1+ keepend contains=pythonEscape,@Spell

hi def link pythonFunctionCall    Function
hi def link pythonOperatorSym     Operator
hi def link pythonDelimiterSym    Delimiter
hi def link pythonDocstring       Comment
hi def link pythonConstantName    Constant
hi def link pythonBuiltinType     Keyword
hi def link pythonBuiltinConstant Constant
hi def link pythonParameter       pythonParam
hi def link pythonParamName       pythonParam
hi def link pythonMethodObject    pythonMethodObj
