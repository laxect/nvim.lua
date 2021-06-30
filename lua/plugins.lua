return require('packer').startup({function(use)
  -- themes
  use {'sonph/onehalf', rtp = 'vim'}
  use 'sainnhe/edge'
  use 'Th3Whit3Wolf/one-nvim'
  use 'marko-cerovac/material.nvim'
  use 'Shatur/neovim-ayu'

  -- auto pair backet
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'

  -- airline
  use ({
    'vim-airline/vim-airline',
    requires = {'vim-airline/vim-airline-themes', opt = true},
    setup = require('plugin/airline'),
  })

  -- comment and uncomment
  use 'scrooloose/nerdcommenter'
  -- git plug
  use 'tpope/vim-fugitive'
  -- Tree look
  use {'scrooloose/nerdtree', opt = true, cmd = 'NERDTreeToggle'}

  -- html emmt
  use 'mattn/emmet-vim'
  -- nvim lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/vim-vsnip'
  use ({'hrsh7th/nvim-compe', config = require('plugin/nvim-compe')})
  use ({'RishabhRD/nvim-lsputils', config = require('plugin/lsputils'), requires = {'RishabhRD/popfix'}})
  -- fzf
  use 'junegunn/fzf.vim'
  -- X
  use 'peitalin/vim-jsx-typescript'
  -- tree-sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  end,
  config = {
    debug = false,
    display = {
      open_fn = function()
      return require('packer.util').float({ border = 'none' })
    end,
    }
  }
})
