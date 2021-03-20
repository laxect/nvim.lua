-- # utils
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function g(key, val)
  vim.api.nvim_set_var(key, val)
end

local function b(key, val)
  vim.api.nvim_buf_set_var(0, key, val)
end

-- # options
-- backup and swap
opt('o', 'backup', false)
opt('o', 'directory', '/dev/shm')
opt('o', 'hidden', true)
-- line number
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'cursorline', true)
-- mouse on
-- a for all
-- r for for |hit-enter| and |more-prompt|
opt('o', 'mouse', 'ar')
-- tabs
opt('b', 'tabstop', 4)
opt('b', 'shiftwidth', 4)
opt('b', 'expandtab', true)
opt('o', 'termguicolors', true)
-- block on https://github.com/neovim/neovim/pull/12378
vim.cmd('autocmd FileType yaml,haskell,lua set tabstop=2 | set shiftwidth=2')
-- completion
opt('o', 'completeopt', 'menuone,noinsert,noselect')
opt('o', 'shortmess', 'filnxtToOFc')

-- # plugins
require('plugins')

vim.cmd('hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white')
vim.cmd('colorscheme onehalflight')

-- # plugin config
-- Bean count
b('beancount_root', '/home/gyara/Documents/ShimaCount/main.bean')

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
