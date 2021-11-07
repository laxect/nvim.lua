local M = {}

M.config = function()
  local gl = require('galaxyline')
  local gls = gl.section
  local condition = require('galaxyline.condition')
  local colors = require('galaxyline.themes.colors')[vim.g.colors_name]

  gl.short_line_list = { ' ' }

  -- reset section for reload
  gls.left = {}
  gls.mid = {}
  gls.right = {}
  gls.short_line_left = {}
  gls.short_line_right = {}

  table.insert(gls.left, {
    StatusIcon = {
      provider = function()
        return '   '
      end,
      highlight = { colors.fg, colors.bg },
      separator = '',
      separator_highlight = { colors.bg, colors.fg },
    },
  })

  table.insert(gls.left, {
    BufferName = {
      provider = { 'FileName' },
      condition = condition.buffer_not_empty,
      highlight = { colors.bg, colors.fg },
      separator = ' ',
      separator_highlight = { colors.fg },
    },
  })

  table.insert(gls.left, {
    Brand = {
      provider = function()
        return '存在するということは、自分を创造することだ。'
      end,
      condition = function()
        return not condition.buffer_not_empty()
      end,
      highlight = { colors.bg, colors.fg },
      separator = ' ',
      separator_highlight = { colors.fg },
    },
  })

  table.insert(gls.left, {
    CurrentDir = {
      provider = function()
        local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
        return ' ' .. dir_name .. ' '
      end,
    },
  })

  local checkwidth = function()
    local squeeze_width = vim.fn.winwidth(0) / 2
    if squeeze_width > 30 then
      return true
    end
    return false
  end

  table.insert(gls.left, {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = checkwidth,
      icon = ' +',
      highlight = { colors.green },
    },
  })

  table.insert(gls.left, {
    DiffModified = {
      provider = 'DiffModified',
      condition = checkwidth,
      icon = '  *',
      highlight = { colors.cyan },
    },
  })

  table.insert(gls.left, {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = checkwidth,
      icon = ' -',
      highlight = { colors.yellow },
    },
  })

  table.insert(gls.right, {
    FileType = {
      provider = function()
        local ft = vim.bo.filetype
        return ft .. ' '
      end,
      condition = condition.buffer_not_empty,
      highlight = { colors.red },
    },
  })

  table.insert(gls.right, {
    LSPStatus = {
      provider = function()
        local clients = vim.lsp.get_active_clients()
        if next(clients) ~= nil then
          return ' ' .. require('lsp-status').status():gsub('%%%%', '%%') -- a temp fix for '%%' in lsp status
        else
          return ''
        end
      end,
      highlight = { colors.black },
    },
  })

  table.insert(gls.right, {
    GitIcon = {
      provider = function()
        return ' '
      end,
      condition = condition.check_git_workspace,
      highlight = { colors.red },
    },
  })

  table.insert(gls.right, {
    GitBranch = {
      provider = 'GitBranch',
      condition = condition.check_git_workspace,
    },
  })

  table.insert(gls.right, {
    Sep = {
      provider = function()
        return ' '
      end,
      highlight = { colors.red },
    },
  })

  table.insert(gls.right, {
    ViMode = {
      provider = function()
        local alias = {
          n = 'N',
          i = 'I',
          c = 'C',
          V = 'V',
          [''] = 'V',
          v = 'V',
          R = 'R',
        }
        local current_Mode = alias[vim.fn.mode()]

        if current_Mode == nil then
          return '  T '
        else
          return '  ' .. current_Mode .. ' '
        end
      end,
      highlight = { colors.bg, colors.red },
    },
  })

  table.insert(gls.right, {
    Sep2 = {
      provider = function()
        return ''
      end,
      highlight = { colors.red, colors.fg },
    },
  })

  table.insert(gls.right, {
    LinePercentage = {
      provider = function()
        local current_line = vim.fn.line('.')
        local col = vim.fn.col('.')
        return '  ' .. current_line .. ',' .. col .. ' '
      end,
      highlight = { colors.bg, colors.fg },
    },
  })

  gls.short_line_left = {
    {
      FileName = {
        provider = { 'FileName' },
        condition = condition.buffer_not_empty,
        highlight = { colors.fg, colors.bg },
      },
    },
  }
end

require('utils').au.group('StatusLine', {
  {
    'ColorScheme',
    '*',
    function()
      require('plugin.statusline').config()
    end,
  },
})

return M
