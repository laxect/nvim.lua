local M = {}

function M.config()
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
