local function g(key, val)
  vim.api.nvim_set_var(key, val)
end

local cmd = vim.api.nvim_command

local function autocmd(this, event, spec)
  local is_table = type(spec) == 'table'
  local pattern = is_table and spec[1] or '*'
  local action = is_table and spec[2] or spec
  if type(action) == 'function' then
    action = this.set(action)
  end
  local e = type(event) == 'table' and table.concat(event, ',') or event
  cmd('autocmd ' .. e .. ' ' .. pattern .. ' ' .. action)
end

local S = {
  __au = {},
}

local au = setmetatable({}, {
  __index = S,
  __newindex = autocmd,
  __call = autocmd,
})

function S.exec(id)
  S.__au[id]()
end

function S.set(fn)
  local id = string.format('%p', fn)
  S.__au[id] = fn
  return string.format('lua require("utils").au.exec("%s")', id)
end

function S.group(grp, cmds)
  cmd('augroup ' .. grp)
  cmd('autocmd!')
  if type(cmds) == 'function' then
    cmds(au)
  else
    for _, aucmd in ipairs(cmds) do
      autocmd(S, aucmd[1], { aucmd[2], aucmd[3] })
    end
  end
  cmd('augroup END')
end

return { map = map, g = g, au = au }
