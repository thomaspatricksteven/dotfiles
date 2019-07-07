call plug#begin('~/nvim/plugged')
Plug 'takac/vim-hardtime'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'johngrib/vim-game-code-break'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set relativenumber
set noswapfile
set nocompatible

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

let g:hardtime_default_on = 1

"---------Visuals---------"
colorscheme atom-dark-256
"colorscheme industry 

"Use 256 colors in terminal vim.
set t_CO=256 

"---------Search---------"
set hlsearch            
set incsearch           


"---------Mappings---------"

"Make it easy to edit the vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Clear search highlight.
nmap <Leader><space> :nohlsearch<cr>


"---------Auto-Commands---------"

"Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END


"---------Pluging Setting---------"
"Fix Vinegar
nmap <Leader>- <Plug>VinegarUp

"Ignore files in CtrlP
let g:ctrlp_custom_ignore = 'node_modules\|git'
nnoremap - -

