local M = {}

M.format = function()
  return {
    exe = 'bean-format',
    args = {
      '-',
    },
    stdin = true,
  }
end

M.setup = function(lsp_common)
  local function OnAttach(first, bufnr)
    lsp_common.on_attach(first, bufnr)
    -- override the format
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>Format<CR>', { noremap = true, silent = true })
  end
  require('lspconfig').beancount.setup({
    cmd = { 'beancount-language-server' },
    on_attach = OnAttach,
    capabilities = lsp_common.gen_capabilities(),
    init_options = {
      journalFile = '~/Documents/ShimaCount/main.beancount',
      pythonPath = 'python3',
    },
  })
end
return M
