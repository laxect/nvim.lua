local M = {}

function M.config()
  -- there is no way to add textobject and operators now.
  -- so we need some hack.
  local text = require('which-key.plugins.presets').objects
  -- treesitter textobject
  text['af'] = 'outer function'
  text['if'] = 'inner function'
  text['ac'] = 'outer class'
  text['ic'] = 'inner class'
  require('which-key').setup({
    plugins = {
      spelling = {
        enabled = true,
      },
    },
  })
  vim.opt.timeoutlen = 500 -- ms
end

return M
