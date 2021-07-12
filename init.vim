lua require 'init'

" call plug#begin('~/nvim/plugged')
" Plug 'neoclide/coc.nvim', {'branch': 'release'}| "COC Vim is the backbone of modern Vim. It does all the IDE stuff.
" Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
" call plug#end()


"--------------------------
"Foundational settings
"--------------------------
"These settings are sane defaults
"They make Vim usable

set diffopt=vertical | "Git diffs open vertically
set wildmode=longest,list,full | "Make tab completion work like bash
set listchars=trail:- " Show trailing spaces

"Resize buffers when window changes sizes
autocmd VimResized * execute "normal! \<c-w>="

" Trigger `autoread` when files changes on disk
" This is the default behaviour of most other editors
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

autocmd BufWritePre * %s/\s\+$//e " Remove trailing spaces

"Pay attention to file types and indentation
filetype plugin indent on

"--------------------------
"Search settings
"--------------------------
set ignorecase | "Case insensitive by default
set smartcase | "If you use Capitals, search is case sensitive
set hlsearch | "Highlight as you search
set incsearch | "Start searching as you type

"--------------------------
"Indentation settings
"--------------------------
set cindent | "Smart indentation
set expandtab | "Tabs convert to spaces
set tabstop=2 | "Use two spaces
set shiftwidth=2 | "Use two spaces

"--------------------------
"Color settings
"--------------------------
set termguicolors | "Use the right colors
highlight clear SignColumn

" always show signcolumns
set signcolumn=yes

hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic

"--------------------------
"Mappings
"--------------------------

"Set leader to space.
map <leader>f <cmd>Telescope find_files<cr> | "Search files
map <leader><space> <cmd>Telescope live_grep<cr>
map <leader>h <cmd>Telescope oldfiles<cr> | "Search Recent files

" let g:shfmt_opt="-ci"

augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
