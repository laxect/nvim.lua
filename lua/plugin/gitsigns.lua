local M = {}

M.config = function()
  require('gitsigns').setup({
    signs = {
      add = { hl = 'DiffAdd', text = '+', numhl = 'GitSignsAddNr' },
      change = {
        hl = 'DiffChange',
        text = '>',
        numhl = 'GitSignsChangeNr',
      },
      delete = { hl = 'DiffDelete', text = '_', numhl = 'GitSignsDeleteNr' },
      topdelete = {
        hl = 'DiffDelete',
        text = '‾',
        numhl = 'GitSignsDeleteNr',
      },
      changedelete = {
        hl = 'DiffChange',
        text = '~',
        numhl = 'GitSignsChangeNr',
      },
    },
    keymaps = {}, -- no default keymaps
    numhl = false,
    watch_index = { interval = 100 },
    sign_priority = 5,
    status_formatter = nil, -- Use default
  })

  require('which-key').register({
    h = {
      name = 'Git',
      s = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', 'Stage' },
      u = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', 'UnStage' },
      r = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', 'Reset' },
      p = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview' },
      b = { '<cmd>lua require"gitsigns".blame_line()<CR>', 'Blame' },
    },
  }, {
    prefix = '<Leader>',
  })
end

return M
