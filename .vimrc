call plug#begin('~/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'takac/vim-hardtime'
call plug#end()

set relativenumber
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
let g:hardtime_default_on = 1
