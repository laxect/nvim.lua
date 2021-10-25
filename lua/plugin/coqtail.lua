local M = {}

function M.setup()
  require('utils').g('coqtail_nomap', 1)
end

function M.config()
  require('utils').au.FileType = {
    'coq',
    function()
      local buffer = vim.api.nvim_get_current_buf()
      local wk = require('which-key')
      wk.register({
        c = { ':CoqStart<cr>', 'Coq start' },
        e = { ':CoqStop<cr>', 'Coq Stop' },
        s = { ':CoqInterrupt<cr>', 'Coq Interrupt' },
        j = { ':CoqNext<cr>', 'Coq Next Sentence(s)' },
        u = { ':CoqUndo<cr>', 'Coq Undo Sentence(s)' },
        l = { ':CoqToLine<cr>', 'Coq run to cursor line' },
      }, {
        prefix = '<Leader>l',
        buffer = buffer,
      })
    end,
  }
end

return M
