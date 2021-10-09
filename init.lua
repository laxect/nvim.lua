local u = require('utils')
-- # options
vim.opt.background = 'light'
-- backup and swap
vim.opt.backup = false
vim.opt.directory = '/dev/shm'
vim.opt.hidden = true
-- line number
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
-- mouse on
-- a for all
-- r for for |hit-enter| and |more-prompt|
vim.opt.mouse = 'ar'
-- tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
-- completion
vim.opt.shortmess = 'filnxtToOFc'
-- block on https://github.com/neovim/neovim/pull/12378
u.au.FileType = {
  'yaml,haskell,lua,javascript',
  function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
}

-- # plugins
require('plugin')

vim.cmd('colorscheme edge')

-- # plugin config

-- treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = 'maintained',
  highlight = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
  indent = { enable = true },
})

local wk = require('which-key')

-- # key map
-- buffer
wk.register({
  q = { '<cmd>tabclose<cr>', 'Close Tab' },
  n = { '<cmd>nohl<cr>', 'Shut HL off' },
  t = {
    t = { '<cmd>tabnew term://zsh<cr>', 'Open Terminal in new tab' },
    v = {
      '<cmd>vsplit term://zsh<cr>',
      'Open Terminal in Split',
    },
  },
  o = { '<cmd>Telescope find_files<cr>', 'Open Files' },
  s = { '<cmd>Telescope live_grep<cr>', 'Search Files' },
  b = { '<cmd>Telescope buffers<cr>', 'List Buffers' },
  ['<space>'] = {
    u = { '<cmd>PackerSync<cr>', 'Packer Sync' },
    r = { '<cmd>source %<cr>', 'Source this File' },
  },
}, {
  prefix = '<Leader>',
})

wk.register({ ['<Leader>c'] = { '<C-\\><C-n><cr>', 'Back to Nvim' } }, { mode = 't' })

require('lang')
