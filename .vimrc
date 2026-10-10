" Enable line number
set number                  
" Enable relative line number
set relativenumber         
" Enable the syntax
syntax on
" Enable autoindent
set autoindent
set smartindent
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

" Color syntax the way bat's Catppuccin Mocha theme does (also used by fzf and
" yazi previews), so code looks the same in every tool. catppuccin/vim maps some
" groups differently; extra matches for function calls, operators, punctuation
" and docstrings live in ~/.vim/after/syntax/.
function! s:CatppuccinLikeBat() abort
  hi Identifier guifg=#cdd6f4 ctermfg=189     " variables are plain text
  hi Operator   guifg=#94e2d5 ctermfg=158     " operators are teal
  hi! link Character    String                " 'c' is a string
  hi! link StorageClass Keyword               " static, const, extern
  hi! link Structure    Keyword               " struct, union, enum
  hi! link Typedef      Keyword
  " C
  hi! link cType   Keyword                     " int, char, void
  hi! link cppType Keyword                     " auto, bool
  hi! link cFormat String                      " %d inside strings
  " Python
  hi! link pythonClass            Type        " class names
  hi! link pythonBuiltin          pythonBuiltinFunc  " print, len, range (italic)
  hi! link pythonExceptions       Constant    " ValueError, KeyError
  hi! link pythonDecorator        Constant
  hi! link pythonDecoratorName    Constant
  hi! link pythonOperator         Keyword     " and, or, not, in, is
  hi! link pythonFStringDelimiter Delimiter
  " shell and zsh: commands are blue, declarations (local, export) are keywords
  hi! link shQuote          String            " the quotes around strings
  hi! link shDeref          Identifier        " $VAR, ${VAR}
  hi! link shStatement      Function          " echo, cd, eval, grep, cat
  hi! link shLoop           Keyword           " for, while (linked to shStatement)
  hi! link shSet            Function          " set, unset
  hi! link zshCommands      Function
  hi! link zshPrecommand    Function          " exec, command, noglob
  hi! link zshTypes         Keyword           " local, typeset, readonly
  hi! link zshOptStart      Function          " setopt, unsetopt
  hi! link zshDereferencing Identifier
  hi! link zshSubst         Identifier
  hi! link zshSubstDelim    Delimiter         " the $( ) around a substitution
  " config files: keys are blue, unquoted values are strings
  hi! link tomlKey                 Function
  hi! link tomlKeyDq               Function
  hi! link tomlKeySq               Function
  hi! link yamlMappingKey          Function
  hi! link yamlKeyValueDelimiter   Operator
  hi! link yamlPlainScalar         String
  hi! link jsonKeyword             Function
  hi! link jsonQuote               Delimiter
  hi! link jsonNoise               Delimiter
  hi! link jsonKeywordMatch        Delimiter  " the : after a key
  " markdown
  hi! link markdownUrl Function
  " Italics, the way bat's Catppuccin theme styles them: comments, function
  " names/calls, and (Python) parameters and item-access are italic. Needs
  " "Use Italic Font" on in the iTerm profile.
  hi Comment   gui=italic cterm=italic
  hi Function  gui=italic cterm=italic        " function names and calls
  hi pythonBuiltinFunc  guifg=#fab387 ctermfg=216 gui=italic cterm=italic
  hi pythonParam        guifg=#eba0ac ctermfg=217 gui=italic cterm=italic
  hi pythonMethodObj    guifg=#89b4fa ctermfg=111 gui=NONE   cterm=NONE
endfunction
augroup catppuccin_like_bat
  autocmd!
  autocmd ColorScheme catppuccin_mocha call s:CatppuccinLikeBat()
augroup END

" vim color theme
colorscheme catppuccin_mocha

" Lightline (status bar)
let g:lightline = {
      \ 'colorscheme': 'catppuccin_mocha',
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


