local M = {}

M.config = function()
  require("tabby").setup({
      tabline = require("tabby.presets").active_wins_at_end,
  })
end

return M
