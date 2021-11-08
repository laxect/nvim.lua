local M = {}

function M.config()
  local configuration = vim.fn['edge#get_configuration']()
  local palette = vim.fn['edge#get_palette'](configuration.style)
  local color = {
    bg = palette.bg0[1],
    fg = palette.fg[1],
    fg_alt = palette.grey[1],
    yellow = palette.yellow[1],
    cyan = palette.cyan[1],
    green = palette.green[1],
    orange = palette.diff_blue[1],
    magenta = palette.purple[1],
    blue = palette.blue[1],
    red = palette.red[1],
  }
  require('plugin.statusline').add_color('edge', color)
end

return M
