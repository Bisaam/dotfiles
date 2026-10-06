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

set background=dark
"set termguicolors
hi clear

" vim color theme
let g:colors_name = 'catppuccin'

" Lightline color theme
let g:lightline = { 'colorscheme': 'dark' }


