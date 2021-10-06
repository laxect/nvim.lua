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
vim.cmd(
    'autocmd FileType yaml,haskell,lua,javascript set tabstop=2 | set shiftwidth=2')
vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

-- # plugins
require('plugins')

vim.cmd('colorscheme edge')

-- # plugin config

-- treesitter
require'nvim-treesitter.configs'.setup {
    ensure_installed = 'maintained',
    highlight = {enable = true},
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm'
        }
    },
    indent = {enable = true}
}

-- # key map
-- buffer
u.map('n', '<Leader>j', '<cmd>tabprev<cr>')
u.map('n', '<Leader>k', '<cmd>tabnext<cr>')
u.map('n', '<Leader>q', '<cmd>tabclose<cr>')
-- close highlighter
u.map('n', '<Leader>n', '<cmd>nohl<cr>')
-- terminal
u.map('n', '<Leader>tt', '<cmd>tabnew term://zsh<cr>')
u.map('n', '<Leader>tv', '<cmd>vsplit term://zsh<cr>')
u.map('t', '<Leader>c', '<C-\\><C-n><cr>')

-- # plugin key map
u.map('n', '<Leader>o', '<cmd>Telescope find_files<cr>')
u.map('n', '<Leader>s', '<cmd>Telescope live_grep<cr>')
u.map('n', '<Leader>b', '<cmd>Telescope buffers<cr>')
u.map('n', '<Leader>l', '<cmd>Telescope treesitter<cr>')
u.map('n', '<Leader><space>u', '<cmd>PackerSync<cr>')
u.map('n', '<Leader><space>r', '<cmd>source $MYVIMRC<cr>')

require('lsp_setting')
