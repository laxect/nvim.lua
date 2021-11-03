require('packer').startup({
  function(use)
    -- themes
    use({ 'sonph/onehalf', rtp = 'vim' })
    use('sainnhe/edge')
    use('Th3Whit3Wolf/one-nvim')
    use('marko-cerovac/material.nvim')
    use('Shatur/neovim-ayu')

    -- which key
    use({ 'folke/which-key.nvim', config = require('plugin.which-key').config })

    -- auto pair backet
    use('tpope/vim-surround')

    -- lines
    use('nvim-lua/plenary.nvim')
    use({
      'glepnir/galaxyline.nvim',
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
      'nanozuki/tabby.nvim',
      config = require('plugin.tabby').config,
    })

    use({
      'lukas-reineke/indent-blankline.nvim',
      config = require('plugin.indentline').config,
    })
    -- language
    -- coq
    use({ 'whonore/Coqtail', setup = require('plugin.coqtail').setup, config = require('plugin.coqtail').config })

    -- comment
    use({ 'terrortylor/nvim-comment', config = require('plugin.comment').config })

    -- html emmt
    use({ 'mattn/emmet-vim', ft = { 'html', 'js', 'ts' } })
    -- nvim lsp
    use('github/copilot.vim')
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
