" Enable line number
set number                  
" Enable relative line number
set relativenumber
" Highlight the current line's number (not the whole line)
set cursorline
set cursorlineopt=number
" Enable the syntax
syntax on
" Enable autoindent
set autoindent
set smartindent
" Indent guides: a faint │ at every indent level, like indent-blankline.nvim.
" Drawn with listchars, so the spacing follows each buffer's shiftwidth.
set list
function! s:IndentGuides() abort
  let &l:listchars = 'tab:│ ,leadmultispace:│' . repeat(' ', shiftwidth() - 1)
endfunction
augroup indent_guides
  autocmd!
  autocmd BufWinEnter,FileType * call s:IndentGuides()
  autocmd OptionSet shiftwidth,tabstop call s:IndentGuides()
augroup END
" Vim Status bar
set laststatus=2
" Disable the startup message
set shortmess+=I
" Highlight the search
set hls 
set noshowmode

" Setting a leader key
let mapleader = " "

" nerdtree
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>f :NERDTreeFind<CR>
nnoremap <C-a>h <C-w>h
nnoremap <C-a>j <C-w>j
nnoremap <C-a>k <C-w>k
nnoremap <C-a>l <C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nerdtree show hidden files
let NERDTreeShowHidden=1

" true colors (vim only sets these escape codes itself for xterm, so do it for tmux too)
if &term =~# '^\(tmux\|screen\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
set background=dark

" Color syntax the way bat's Nord theme does (also used by fzf and yazi
" previews), so code looks the same in every tool. nord-vim and bat's theme
" share a palette but not every mapping; extra matches for function calls,
" operators, punctuation and docstrings live in ~/.vim/after/syntax/.
" ctermfg values are ANSI numbers, which iTerm fills in from its Nord palette.
function! s:NordLikeBat() abort
  hi Constant  guifg=#81A1C1 ctermfg=4         " True, None, null and ALL_CAPS are blue
  hi ClassName guifg=#8FBCBB ctermfg=14        " class, exception and struct names are teal
  " C
  hi cInclude guifg=#5E81AC ctermfg=12         " #include is the darker blue, #define isn't
  hi! link cIncluded String                    " <stdio.h>
  " Python. builtin functions are italic, as in bat (needs "Use Italic Font" on
  " in the iTerm profile, which markdown *emphasis* also uses)
  hi! link pythonClass         ClassName
  hi! link pythonExceptions    ClassName       " ValueError, KeyError
  hi! link pythonDecoratorName Identifier      " only the @ is colored
  hi pythonDecorator   guifg=#D08770 ctermfg=11
  hi pythonBuiltinFunc guifg=#88C0D0 ctermfg=6 gui=italic cterm=italic
  hi! link pythonBuiltin pythonBuiltinFunc     " print, len, range (italic)
  " shell and zsh: commands are functions, declarations (local, export) are keywords
  hi! link shQuote          String             " the quotes around strings
  hi! link shVarAssign      Operator           " the = in name=value
  hi! link shStatement      Function           " echo, cd, eval
  hi! link kshStatement     Function           " grep, ls, dirname
  hi! link shLoop           Keyword            " for, while (linked to shStatement)
  hi! link shSet            Function           " set, unset
  hi! link zshCommands      Function
  hi! link zshPrecommand    Function           " exec, command, noglob
  hi! link zshTypes         Keyword            " local, typeset, readonly
  hi! link zshOptStart      Function           " setopt, unsetopt
  hi! link zshFunction      Function
  hi! link zshOperator      Operator           " ; && ||
  hi! link zshPreProc       Comment            " the #! line
  hi! link zshDeref         Identifier         " $VAR
  hi! link zshDereferencing Identifier
  hi! link zshSubst         Identifier         " ${VAR}
  hi! link zshSubstDelim    Delimiter          " the $( ) around a substitution
  " config files: toml keys are blue, yaml keys teal, json keys plain strings
  hi! link tomlKey                   Keyword
  hi! link tomlKeyDq                 Keyword
  hi! link tomlKeySq                 Keyword
  hi! link yamlBlockMappingDelimiter Delimiter  " the : after a key
  hi! link yamlKeyValueDelimiter     Delimiter
  hi! link yamlPlainScalar           String     " unquoted values
  hi! link jsonKeyword               String
  hi! link jsonQuote                 String
  hi! link jsonKeywordMatch          Delimiter  " the : after a key
  hi! link jsonNoise                 Delimiter
  hi! link jsonNull                  Constant
  " markdown: the # in a heading is the heading's color
  hi! link markdownHeadingDelimiter markdownH1
  " editor
  hi CursorLineNr guifg=#88C0D0 ctermfg=6 gui=bold cterm=bold    " current line number is bold frost, like NORMAL
  hi SpecialKey guifg=#434C5E ctermfg=0 guibg=NONE ctermbg=NONE  " indent guides are faint nord2
endfunction
augroup nord_like_bat
  autocmd!
  autocmd ColorScheme nord call s:NordLikeBat()
augroup END

" Transparent background so terminal opacity shows through
augroup transparent_bg
  autocmd!
  autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight NonText ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight LineNr ctermbg=NONE guibg=NONE
  autocmd ColorScheme * highlight SignColumn ctermbg=NONE guibg=NONE
augroup END

" vim color theme
let g:nord_italic = 1   " nord-vim only uses italics when $TERM_ITALICS is set otherwise
colorscheme nord

" Lightline (status bar)
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \ },
      \ 'inactive': {
      \   'left':  [ [ 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': '%l:%-2c',
      \ },
      \ 'component_function': {
      \   'fileformat': 'LightlineFileformat',
      \   'fileencoding': 'LightlineFileencoding',
      \   'filetype': 'LightlineFiletype',
      \ },
      \ 'separator': { 'left': "\ue0b4", 'right': "\ue0b6" },
      \ 'subseparator': { 'left': "\ue0b5", 'right': "\ue0b7" },
      \ }

" only show fileformat/encoding when they're not the usual unix/utf-8
function! LightlineFileformat()
  return &fileformat ==# 'unix' ? '' : &fileformat
endfunction
function! LightlineFileencoding()
  return &fileencoding ==# 'utf-8' || &fileencoding ==# '' ? '' : &fileencoding
endfunction
function! LightlineFiletype()
  return &filetype
endfunction


