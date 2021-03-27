vim.api.nvim_exec([[
  call plug#begin('~/.local/share/nvim/plugged')
  " auto pair backet
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  " airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " comment and uncomment
  Plug 'scrooloose/nerdcommenter'
  " git plug
  Plug 'tpope/vim-fugitive'
  " Tree look
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'  }
  " themes
  Plug 'sonph/onehalf', {'rtp': 'vim'}
  " html emmt
  Plug 'mattn/emmet-vim'
  " nvim lsp
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  " fzf
  Plug '/bin/fzf'
  Plug 'junegunn/fzf.vim'
  " X
  Plug 'peitalin/vim-jsx-typescript'
  " Beancount
  Plug 'nathangrigg/vim-beancount'
  " tree-sitter
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  " search
  Plug 'jremmen/vim-ripgrep'
  call plug#end()
]], true);
