vim.o.inccommand = 'split'
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.showcmd = true
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.splitright = true -- Vertical splits will automatically be to the right
vim.wo.number = true

vim.o.completeopt = "menuone,noselect" -- For compe

vim.cmd('colorscheme ' .. 'tokyonight' )

vim.o.undofile = true
vim.cmd('set noswapfile')
