-- # utils
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function g(key, val)
  vim.api.nvim_set_var(key, val)
end

return { map = map, g = g }
