-- # utils
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function g(key, val)
  vim.api.nvim_set_var(key, val)
end

-- # options
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
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.shortmess = 'filnxtToOFc'
-- block on https://github.com/neovim/neovim/pull/12378
vim.cmd('autocmd FileType yaml,haskell,lua,javascript set tabstop=2 | set shiftwidth=2')

-- # plugins
require('plugins')

vim.cmd('hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white')

-- # plugin config

-- Airline
g('airline_powerline_fonts', 1)
g('airline_theme', 'atomic')
g('airline_extensions', {'tabline', 'branch'})

-- treesitter
require 'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  }
}

-- # key map
-- buffer
map('n', '<Leader>j', '<cmd>bp<cr>')
map('n', '<Leader>k', '<cmd>bn<cr>')
-- close highlighter
map('n', '<Leader>n', '<cmd>nohl<cr>')
-- terminal
map('n', '<Leader>t', '<cmd>e term://zsh<cr>')
map('t', '<Leader>c', '<C-\\><C-n><cr>')
-- smart tab
map('n', '<Leader>b', '<cmd>cclose<cr>')
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true})
map('i', '<cr>', 'pumvisible() ? "\\<C-y>" : "\\<cr>"', {expr = true})

-- # lsp config and key map

require('lsp_setting')
