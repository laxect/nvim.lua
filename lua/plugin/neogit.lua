local M = {}

function M.config()
  local neogit = require('neogit')
  neogit.setup({})
  local wk = require('which-key')
  wk.register({ ['<Leader>g'] = { '<cmd>Neogit<cr>', 'Open Neogit' } })
end

return M
