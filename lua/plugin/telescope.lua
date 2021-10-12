local M = {}

function M.config()
  require('telescope').load_extension('zoxide')
  require('telescope._extensions.zoxide.config').setup({
    prompt_title = '[ Zoxide List ]',
    list_command = 'zoxide query -ls',
    mappings = {
      default = {
        action = function(selection)
          vim.cmd('tcd ' .. selection.path)
        end,
        after_action = function(selection)
          print('Directory changed to ' .. selection.path)
        end,
      },
    },
  })

  local wk = require('which-key')
  wk.register({
    o = { '<cmd>Telescope find_files<cr>', 'Open Files' },
    s = { '<cmd>Telescope live_grep<cr>', 'Search Files' },
    b = { '<cmd>Telescope buffers<cr>', 'List Buffers' },
    c = {
      function()
        require('telescope').extensions.zoxide.list()
      end,
      'Z',
    },
  }, {
    prefix = '<Leader>',
  })
end

return M
