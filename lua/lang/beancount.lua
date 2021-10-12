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

M.filetypes = '*.beancount'

M.setup = function(lsp_common)
  local function on_attach(first, bufnr)
    lsp_common.on_attach(first, bufnr, true)
  end
  require('lspconfig').beancount.setup({
    cmd = { 'beancount-language-server', '--stdio' },
    on_attach = on_attach,
    capabilities = lsp_common.gen_capabilities(),
    init_options = {
      journalFile = '~/Documents/ShimaCount/main.beancount',
      pythonPath = 'python3',
    },
  })
end

return M
