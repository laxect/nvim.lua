return require('packer').startup({
    function(use)
        -- themes
        use {'sonph/onehalf', rtp = 'vim'}
        use 'sainnhe/edge'
        use 'Th3Whit3Wolf/one-nvim'
        use 'marko-cerovac/material.nvim'
        use 'Shatur/neovim-ayu'

        -- auto pair backet
        use 'jiangmiao/auto-pairs'
        use 'tpope/vim-surround'

        use {
            'glepnir/galaxyline.nvim',
            config = require('plugin/statusline').config(),
            requires = {'kyazdani42/nvim-web-devicons', opt = true}
        }

        use {
            'akinsho/nvim-bufferline.lua',
            config = require('plugin/bufferline').config()
        }

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
        use({'hrsh7th/nvim-compe', config = require('plugin/nvim-compe')})
        use({
            'RishabhRD/nvim-lsputils',
            config = require('plugin/lsputils').config,
            setup = require('plugin/lsputils').setup,
            requires = {'RishabhRD/popfix'}
        })
        use 'ray-x/lsp_signature.nvim'
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
                return require('packer.util').float({border = 'none'})
            end
        }
    }
})

