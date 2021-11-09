require('packer').startup({
  function(use)
    -- themes
    use({ 'sainnhe/edge', config = require('plugin.edge').config })
    use({
      'rose-pine/neovim',
      config = function()
        vim.g.rose_pine_variant = 'dawn'
        vim.cmd('highlight TabLineSel guifg=#f2e9de guibg=#575279')
      end,
    })

    -- which key
    use({ 'folke/which-key.nvim', config = require('plugin.which-key').config })

    -- auto pair backet
    use('tpope/vim-surround')

    -- lines
    use({
      'nanozuki/tabby.nvim',
      config = require('plugin.tabby').config,
    })

    use('nvim-lua/plenary.nvim')
    use({
      'TimUntersberger/neogit',
      config = require('plugin.neogit').config,
      requires = { 'sindrets/diffview.nvim' },
    })
    use({
      'NTBBloodbath/galaxyline.nvim',
      config = require('plugin.statusline').config,
      requires = {
        {
          'lewis6991/gitsigns.nvim',
          event = 'BufRead',
          config = require('plugin.gitsigns').config,
        },
        { 'nvim-lua/lsp-status.nvim' },
      },
    })

    use({
      'lukas-reineke/indent-blankline.nvim',
      config = require('plugin.indentline').config,
    })
    -- language
    -- coq
    use({
      'whonore/Coqtail',
      setup = require('plugin.coqtail').setup,
      config = require('plugin.coqtail').config,
      ft = { 'coq' },
    })

    -- comment
    use({ 'terrortylor/nvim-comment', config = require('plugin.comment').config })

    -- html emmt
    use({ 'mattn/emmet-vim', ft = { 'html', 'js', 'ts' } })
    -- nvim lsp
    use({
      'github/copilot.vim',
      config = function()
        vim.g.copilot_enable = true
      end,
    })
    use('mhartington/formatter.nvim')
    use('neovim/nvim-lspconfig')
    use('L3MON4D3/LuaSnip')
    use({ 'hrsh7th/nvim-cmp', config = require('plugin.nvim-cmp').config })
    use('saadparwaiz1/cmp_luasnip')
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-cmdline')
    use('windwp/nvim-autopairs')
    use({
      'RishabhRD/nvim-lsputils',
      config = require('plugin.lsputils').config,
      setup = require('plugin.lsputils').setup,
      requires = { 'RishabhRD/popfix' },
    })
    use('ray-x/lsp_signature.nvim')
    use({ 'folke/trouble.nvim', config = require('plugin.trouble').config })
    -- telescope
    use({
      'nvim-telescope/telescope.nvim',
      config = require('plugin.telescope').config,
      requires = { 'jvgrootveld/telescope-zoxide' },
    })
    -- X
    use('peitalin/vim-jsx-typescript')
    -- tree-sitter
    use({
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = require('plugin.treesitter').config,
      requires = { 'nvim-treesitter/nvim-treesitter-textobjects', 'romgrk/nvim-treesitter-context' },
    })
    use('terminalnode/sway-vim-syntax')
    use('nfnty/vim-nftables')
    -- color
    use({
      'norcalli/nvim-colorizer.lua',
      config = require('plugin.colorize').config,
    })
  end,
  config = {
    debug = false,
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'none' })
      end,
    },
  },
})
