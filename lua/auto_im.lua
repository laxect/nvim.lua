local u = require('utils')

local M = {}

local state = {
  enabled = false,
  is_active = false,
}

local fcitx5_cmd = 'fcitx5-remote'
local function fcitx5()
  state.enable = true

  local function is_active()
    return u.capture(fcitx5_cmd) == '2'
  end

  M.insert = function()
    if state.is_active then
      os.execute(fcitx5_cmd .. ' -o')
    end
  end

  M.normal = function()
    state.is_active = is_active()
    os.execute(fcitx5_cmd .. ' -c')
  end
end

if vim.fn.executable(fcitx5_cmd) == 1 then
  fcitx5()
end

if state.enable then
  u.au.group('AutoIM', function(aucmd)
    aucmd({ 'InsertEnter' }, function()
      require('auto_im').insert()
    end)
    aucmd({ 'InsertLeave', 'VimEnter' }, function()
      require('auto_im').normal()
    end)
  end)
end

return M
