local u = require('utils')

local M = {
  enabled = false,
}

local state = {
  is_active = false,
}

local function fcitx5()
  M.enable = true
  local cmd = 'fcitx5-remote'

  local function is_active()
    return u.capture(cmd) == '2'
  end

  M.insert = function()
    if state.is_active then
      os.execute(cmd .. ' -o')
    end
  end

  M.normal = function()
    state.is_active = is_active()
    os.execute(cmd .. ' -c')
  end
end

if vim.fn.executable('fcitx5') == 1 then
  fcitx5()
end

if M.enable then
  u.au.group('IMAuto', function(aucmd)
    aucmd({ 'InsertEnter' }, function()
      require('auto_im').insert()
    end)
    aucmd({ 'InsertLeave', 'VimEnter' }, function()
      require('auto_im').normal()
    end)
  end)
end

return M
