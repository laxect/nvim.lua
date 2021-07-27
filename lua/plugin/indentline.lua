local M = {}

M.setup = function()
  require('utils').g('indentLine_setConceal', 0)
  require('utils').g('indentLine_char', '┊')
end

return M
