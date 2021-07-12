-- Leader
vim.api
    .nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ' '

-- Search
vim.api.nvim_set_keymap('n', '<Leader>/', ':nohlsearch<CR>',
                        {noremap = true, silent = true})

-- Window Movement
vim.api.nvim_set_keymap('n', '<C-J>', '<C-W><C-J>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-K>', '<C-W><C-K>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-L>', '<C-W><C-L>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-H>', '<C-W><C-H>', {silent = true})

-- Pasting
vim.api.nvim_set_keymap('v', '<Leader>p', '"_dP | "',
                        {noremap = true, silent = true})

-- Show blame
vim.api.nvim_set_keymap('n', '<Leader>b',
                        ':Gitsigns toggle_current_line_blame<CR>',
                        {noremap = true, silent = true})
