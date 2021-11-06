local M = {}

function M.config()
  local diffview = require('diffview')
  diffview.setup({
    use_icons = false,
  })
  local neogit = require('neogit')
  neogit.setup({
    integrations = {
      diffview = true,
    },
  })
  local wk = require('which-key')
  wk.register({ ['<Leader>g'] = { '<cmd>Neogit<cr>', 'Open Neogit' } })
end

return M
