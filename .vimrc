call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
call plug#end()

colorscheme nord

set nocompatible
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set shiftwidth=4
set tabstop=4
set expandtab
set smarttab
set nobackup
set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set showcmd
set showmode
set showmatch
set hlsearch
set laststatus=2

" Remaps for compiling and running cpp files
nnoremap <C-c> :!clear; g++ -o %:r.out % <Enter>
nnoremap <C-x> :!clear; ./%:r.out
