local M = {}

M.config = function()
  require('indent_blankline').setup({
    char = '┊',
    -- show_current_context = true,
    show_first_indent_level = false,
    buftype_exclude = { 'terminal', 'help', 'nofile', 'quickfix' },
    filetype_exclude = { 'man' },
  })
end

return M
