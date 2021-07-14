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

vim.api.nvim_set_keymap('n', '<Leader>f', '<cmd>Telescope find_files<CR>',
                        {noremap = true, silent = true})

vim.api.nvim_set_keymap('n', '<Leader><space>', '<cmd>Telescope live_grep<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>h', '<cmd>Telescope oldfiles<CR>',
                        {noremap = true, silent = true})

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col "." - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
        return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

vim.api.nvim_set_keymap("i", "<C-Space>", "compe#complete()",
                        {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')",
                        {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')",
                        {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })",
                        {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })",
                        {noremap = true, silent = true, expr = true})

-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>',
                        opts)
vim.api
    .nvim_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
vim.api.nvim_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
vim.api.nvim_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<C-k>',
                        '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>wl',
                        '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<space>D',
                        '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
vim.api.nvim_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '<space>ca',
                        '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
vim.api
    .nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>e',
                        '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                        opts)
vim.api.nvim_set_keymap('n', '[d',
                        '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d',
                        '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q',
                        '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>s', '<cmd>SymbolsOutline<CR>', opts)
vim.api.nvim_set_keymap('n', '-', '<cmd>NvimTreeToggle<CR>', opts)
