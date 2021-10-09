local M = {}

function M.config()
  require('utils').g('NERDCreateDefaultMappings', 0)
  local wk = require('which-key')
  wk.register({
    ['<Leader>c'] = { '<Plug>NERDCommenterToggle', 'Toggle Comment' },
  })
end

return M
