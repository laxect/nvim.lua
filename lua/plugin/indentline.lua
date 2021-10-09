local M = {}

M.config = function()
  local u = require('utils')
  u.g('indentLine_char', '┊')
  u.g('indentLine_setColors', 0)
end

return M
