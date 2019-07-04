call plug#begin('~/nvim/plugged')
Plug 'takac/vim-hardtime'
Plug 'w0rp/ale'
Plug 'tpope/vim-vinegar'
call plug#end()


set relativenumber
set noswapfile

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


"---------Fix Vinegar---------"
nmap <Leader>- <Plug>VinegarUp
nnoremap - -
