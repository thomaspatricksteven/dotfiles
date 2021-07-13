return require('packer').startup(function(use)
    -- Packer manages itself
    use 'wbthomason/packer.nvim'

    use 'kyazdani42/nvim-web-devicons'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'

    use 'hrsh7th/vim-vsnip'
    use 'rafamadriz/friendly-snippets'

    use 'lukas-reineke/format.nvim'

    use {
        'jose-elias-alvarez/nvim-lsp-ts-utils',
        ft = {
            "javascript", "javascriptreact", "javascript.jsx", "typescript",
            "typescriptreact", "typescript.tsx"
        }
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        ft = {
            "javascript", "javascriptreact", "javascript.jsx", "typescript",
            "typescriptreact", "typescript.tsx"
        },
        config = function() require("null-ls").setup() end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }

    use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'}}

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }

    use 'simrat39/symbols-outline.nvim'

    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use 'jwalton512/vim-blade'
    use 'machakann/vim-highlightedyank'
    use 'honza/vim-snippets'
    use 'folke/tokyonight.nvim'
    use 'rhysd/git-messenger.vim'
    use 'sheerun/vim-polyglot'
    use 'junegunn/goyo.vim'
    use 'tpope/vim-abolish'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'tpope/vim-vinegar'
    use 'jparise/vim-graphql'
    use 'wellle/targets.vim'
end)

