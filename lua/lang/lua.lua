local M = {}

M.format = function()
  local config_file = vim.fn.findfile('stylua.toml', '.;')
  local config_flag = ''
  if vim.fn.empty(config_file) == 0 then
    config_flag = '--config-path ' .. config_file
  end
  return {
    exe = 'stylua',
    args = {
      config_flag,
      '-',
    },
    stdin = true,
  }
end

M.setup = function(lsp_common)
  -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
  local sumneko_root_path = vim.fn.stdpath('cache') .. '/lspconfig/sumneko_lua/lua-language-server'
  local sumneko_binary = '/usr/bin/lua-language-server'
  local runtime_path = vim.split(package.path, ';')
  table.insert(runtime_path, 'lua/?.lua')
  table.insert(runtime_path, 'lua/?/init.lua')
  local function on_attach(first, bufnr)
    lsp_common.on_attach(first, bufnr)
    -- override the format
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>Format<CR>', { noremap = true, silent = true })
  end

  require('lspconfig').sumneko_lua.setup({
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    capabilities = lsp_common.gen_capabilities(),
    settings = {
      Lua = {
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = 'LuaJIT',
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { 'vim' },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file('', true),
        },
      },
    },
    on_attach = on_attach,
  })
end
return M
