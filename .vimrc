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


