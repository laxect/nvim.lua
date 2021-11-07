local u = require('utils')
-- # options
vim.opt.background = 'light'
-- backup and swap
vim.opt.backup = false
vim.opt.directory = '/dev/shm'
vim.opt.hidden = true
-- line number
vim.opt.number = true
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

local wk = require('which-key')

-- # key map
-- buffer
wk.register({
  q = { '<cmd>tabclose<cr>', 'Close Tab' },
  t = {
    name = 'Terminal',
    t = { '<cmd>tabnew term://zsh<cr>', 'Open Terminal in new tab' },
    v = {
      '<cmd>vsplit term://zsh<cr>',
      'Open Terminal in Split',
    },
  },
  ['<space>'] = {
    name = 'Vim Actions',
    u = { '<cmd>PackerSync<cr>', 'Packer Sync' },
    r = { '<cmd>source %<cr>', 'Source this File' },
  },
}, {
  prefix = '<Leader>',
})

local exit_terminal_seq = vim.api.nvim_replace_termcodes('<C-\\><C-N>', true, true, true)
wk.register({ ['<Leader>c'] = { exit_terminal_seq, 'Back to Nvim' } }, { mode = 't' })

require('lang')

u.au.group('FocusedAndUnfocused', function(aucmd)
  aucmd({ 'WinEnter', 'BufEnter' }, function()
    vim.wo.relativenumber = true
    vim.wo.cursorline = true
  end)
  aucmd({ 'WinLeave', 'BufLeave' }, function()
    vim.wo.relativenumber = false
    vim.wo.cursorline = false
  end)
end)

require('auto_im')
