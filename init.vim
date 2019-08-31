call plug#begin('~/nvim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Shougo/denite.nvim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

call plug#end()
set nocompatible
syntax on
set noswapfile

filetype plugin indent on

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" On pressing tab, insert 2 spaces
set expandtab

"---------Visuals---------"
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

" === Limelight and Goyo ===
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
