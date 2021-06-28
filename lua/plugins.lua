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
  use ({'sonph/onehalf', rtp = 'vim', config = function () vim.cmd('colorscheme onehalflight') end})
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
  -- search
  use 'jremmen/vim-ripgrep'
  end,
  config = {
    debug = true,
    display = {
      open_fn = require('packer.util').float,
    }
  }
})
