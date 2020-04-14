"--------------------------
"Tom's Vim RC 
"--------------------------
"
"These are my NeoVim settings, but they should work with standard vim, too

"--------------------------
"Plugins
"--------------------------
"These need to go at the top of the file
"You need to install a plugin manager
"I'm using https://github.com/junegunn/vim-plug - Learn how to use it by reading the README
"All plugins are repos on GitHub, so if you want more details visit GitHub
"You MUST install these using :PlugInstall

call plug#begin('~/nvim/plugged')
Plug 'HerringtonDarkholme/yats.vim' | "TS Syntax
Plug 'airblade/vim-gitgutter' | "git info in editor
Plug 'bluz71/vim-nightfly-guicolors' | "color scheme
Plug 'itchyny/lightline.vim' | "Status bar
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | "Installs FZF on the system.
Plug 'junegunn/fzf.vim' | "Fuzzy find. Find in project. Find file by name. Regex search. Much more.
Plug 'junegunn/goyo.vim' | "Distraction free mode
Plug 'junegunn/limelight.vim' | "Text highlighting
Plug 'junegunn/vim-peekaboo' | "Show registers
Plug 'mhinz/vim-grepper' | "Grep vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}| "COC Vim is the backbone of modern Vim. It does all the IDE stuff.
Plug 'pechorin/any-jump.vim' | " Any jump let's you jump to related places.
Plug 'rhysd/git-messenger.vim' | "View git commit information
Plug 'sheerun/vim-polyglot' | "A language pack
Plug 'tpope/vim-abolish' | "Text manipulation, including conversion to snake_case and camelCase.
Plug 'tpope/vim-commentary' | "Add comments to code.
Plug 'tpope/vim-fugitive'| "Git in Vim. Lots to learn, but really good.
Plug 'tpope/vim-surround'| "Surround text with quotes, brackets, ect.
Plug 'tpope/vim-vinegar'| "Makes the default vim file tree (netrw) much better
Plug 'wellle/targets.vim'
call plug#end()

"--------------------------
"Foundational settings
"--------------------------
"These settings are sane defaults
"They make Vim usable

syntax on | "Syntax highlighting
set showcmd | "Makes the command visible as typed
set number | "Show line numbers
set diffopt=vertical | "Git diffs open vertically
set splitbelow | "New buffers open below, not above
set splitright | "New buffers open to the right, not left
set nocompatible | "Don't try to work with older vim
set noswapfile | "Don't use swap files 
set noshowmode | "Don't show mode, plugin does it already
set noemoji | "Fixes emoji double width
set undofile | "Allows undo after closing and reopening a file
set spell | "Spell check

"Resize buffers when window changes sizes
autocmd VimResized * execute "normal! \<c-w>=" 

"Pay attention to file types and indentation
filetype plugin indent on

"Switch buffers by holding CTRL and direction
"The vim default requires you to hit 'w' every time
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Trigger `autoread` when files changes on disk
" This is the default behaviour of most other editors
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

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
colorscheme nightfly
let g:lightline = { 'colorscheme': 'nightfly' }
let g:nightflyCursorColor = 1
let g:nightflyUnderlineMatchParen = 1

hi Comment cterm=italic
set background=dark

"--------------------------
"Mappings
"--------------------------
"These are the mappings I like. You might hate them.

"Set leader to space. If you don't know what leader is,
"you should learn.
let mapleader = "\<space>"
nmap <leader>/ :nohlsearch<cr> | "Clear search highlight.
map <leader>f :FZF<CR> | "Search files
map <leader>h :History<CR> | "Search Recent files
map <leader>g :Grepper<CR> | "Search using grepper
map <leader><space> :Rg<CR> | "Search in project files

nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

let g:vim_printer_items = {
      \ 'javascript': 'console.log("{$}:", {$})',
      \ 'typescript': 'console.log("{$}:", {$})',
      \ }

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -rf'
let g:netrw_rmdir_cmd='rm -rf'

"--------------------------
"COC
"--------------------------
"EVERYTHING below is COC Vim
"This makes vim behave like an IDE

set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" use `:Prettier` to run prettier 
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" coc extensions
let g:coc_global_extensions = [
      \ 'coc-angular',
      \ 'coc-css',
      \ 'coc-docker',
      \ 'coc-emmet',
      \ 'coc-highlight',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-pairs',
      \ 'coc-phpls',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-spell-checker',
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \]

let $NVIM_COC_LOG_LEVEL = 'debug'
