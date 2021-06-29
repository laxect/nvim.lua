return require('packer').startup({function(use)
  -- auto pair backet
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  -- airline
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  -- comment and uncomment
  use 'scrooloose/nerdcommenter'
  -- git plug
  use 'tpope/vim-fugitive'
  -- Tree look
  use {'scrooloose/nerdtree', opt = true, cmd = 'NERDTreeToggle'}
  -- themes
  use {'sonph/onehalf', rtp = 'vim'}
  use {'Th3Whit3Wolf/one-nvim'}

  -- html emmt
  use 'mattn/emmet-vim'
  -- nvim lsp
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  -- fzf
  use 'junegunn/fzf.vim'
  -- X
  use 'peitalin/vim-jsx-typescript'
  -- tree-sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  end,
  config = {
    debug = true,
    display = {
      open_fn = function()
      return require('packer.util').float({ border = 'none' })
    end,
    }
  }
})
