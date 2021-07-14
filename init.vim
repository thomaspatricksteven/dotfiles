lua require 'init'

"Pay attention to file types and indentation
filetype plugin indent on

set diffopt=vertical | "Git diffs open vertically
set wildmode=longest,list,full | "Make tab completion work like bash
set listchars=trail:- " Show trailing spaces

"--------------------------
"Auto Commands
"--------------------------

"Resize buffers when window changes sizes
autocmd VimResized * execute "normal! \<c-w>="

" Trigger `autoread` when files changes on disk
" This is the default behaviour of most other editors
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

autocmd BufReadPost,FileReadPost lua require "lsp_signature".on_attach()

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

