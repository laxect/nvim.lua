require('packer').startup({
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

        -- lines
        use 'nvim-lua/plenary.nvim'
        use({
            'glepnir/galaxyline.nvim',
            config = require('plugin/statusline').config,
            requires = {
                {'kyazdani42/nvim-web-devicons', opt = true}, {
                    'lewis6991/gitsigns.nvim',
                    event = 'BufRead',
                    config = require('plugin/gitsigns').config
                }
            }
        })

        use({
            'akinsho/nvim-bufferline.lua',
            config = require('plugin/bufferline').config
        })

        use({'yggdroot/indentline', setup = require('plugin/indentline').setup})

        -- comment and uncomment
        use 'scrooloose/nerdcommenter'
        -- Tree look
        use {'scrooloose/nerdtree', opt = true, cmd = 'NERDTreeToggle'}

        -- html emmt
        use 'mattn/emmet-vim'
        -- nvim lsp
        use 'neovim/nvim-lspconfig'
        use 'L3MON4D3/LuaSnip'
        use({'hrsh7th/nvim-cmp', config = require('plugin/nvim-cmp').setup})
        use 'saadparwaiz1/cmp_luasnip'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'hrsh7th/cmp-path'
        use({
            'RishabhRD/nvim-lsputils',
            config = require('plugin/lsputils').config,
            setup = require('plugin/lsputils').setup,
            requires = {'RishabhRD/popfix'}
        })
        use 'ray-x/lsp_signature.nvim'
        use 'hashivim/vim-packer'
        -- fzf
        use 'junegunn/fzf.vim'
        -- X
        use 'peitalin/vim-jsx-typescript'
        -- tree-sitter
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use 'terminalnode/sway-vim-syntax'
        use 'nfnty/vim-nftables'
        -- git
        use 'tpope/vim-fugitive'
        -- color
        use({
            'norcalli/nvim-colorizer.lua',
            config = require('plugin/colorize').config
        })
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

