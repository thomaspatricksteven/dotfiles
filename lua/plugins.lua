return require('packer').startup(function(use)
  -- Packer manages itself
  use 'wbthomason/packer.nvim'

  use 'kyazdani42/nvim-web-devicons'

  -- Tree
  -- use 'kyazdani42/nvim-tree.lua'

  -- LSP
  --use 'neovim/nvim-lspconfig'
  --use 'glepnir/lspsaga.nvim'
  --use 'hrsh7th/nvim-compe'
  --use 'hrsh7th/vim-vsnip'
  --use "rafamadriz/friendly-snippets"

  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }

  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use 'simrat39/symbols-outline.nvim'

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

