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
Plug 'francoiscabrol/ranger.vim' | "Use ranger in vim for file tree stuff.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | "Installs FZF on the system.
Plug 'junegunn/fzf.vim' | "Fuzzy find. Find in project. Find file by name. Regex search. Much more.
Plug 'morhetz/gruvbox' | "Color theme.
Plug 'neoclide/coc.nvim', {'branch': 'release'}| "COC Vim is the backbone of modern Vim. It does all the IDE stuff.
Plug 'tpope/vim-abolish' | "Text manipulation, including conversion to snake_case and camelCase.
Plug 'tpope/vim-commentary' | "Add comments to code.
Plug 'tpope/vim-fugitive'| "Git in Vim. Lots to learn, but really good.
Plug 'tpope/vim-surround'| "Surround text with quotes, brackets, ect.
Plug 'meain/vim-printer'
"Plug 'takac/vim-hardtime' "Doesn't let you hit jkhl successively to move
call plug#end()
"--------------------------
"Foundational settings
"--------------------------
"These settings are sane defaults
"They make vim useable

syntax on | "Syntax highlighting
set showcmd | "Makes the command visible as typed
set number | "Show line numbers
set diffopt=vertical | "Git diffs open vertically
set splitbelow | "New buffers open below, not above
set splitright | "New buffers open to the right, not left
set nocompatible | "Don't try to work with older vim
set noswapfile | "Don't use swap files 

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

" Triger `autoread` when files changes on disk
" This is the default behaviour of most other editors
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"--------------------------
"Search settings
"--------------------------
set ignorecase | "Case insensitive by default
set smartcase | "If you use Captials, search is case sensitve
set hlsearch | "Highlight as you search
set incsearch | "Start searching as you type

"--------------------------
"Identation settings
"--------------------------
set cindent | "Smart indentation
set expandtab | "Tabs convert to spaces
set tabstop=2 | "Use two spaces
set shiftwidth=2 | "Use two spaces

"--------------------------
"Color settings
"--------------------------
set termguicolors | "Use the right colors
colorscheme gruvbox

"--------------------------
"Mappings
"--------------------------
"These are the mappins I like. You might hate them.

"Set leader to space. If you don't know what leader is,
"you should learn.
let mapleader = "\<space>"
nmap <leader>/ :nohlsearch<cr> | "Clear search highlight.
map <leader>f :FZF<CR> | "Search files
map <leader>h :History<CR> | "Search Recent files
map <leader><space> :Rg<CR> | "Search in project files
map <leader>t :Ranger<CR> | "Show file tree in ranger
let g:ranger_map_keys = 0 | "Don't let ranger map keys


let g:vim_printer_items = {
      \ 'javascript': 'console.log("{$}:", {$})',
      \ 'typescript': 'console.log("{$}:", {$})',
      \ }

"--------------------------
"COC
"--------------------------
"EVERYTHING below is COC Vim
"This makes vim behave like an IDE

" if hidden is not set, TextEdit might fail.
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
      \ 'coc-solargraph',
      \ 'coc-tsserver',
      \ 'coc-yaml',
      \]
