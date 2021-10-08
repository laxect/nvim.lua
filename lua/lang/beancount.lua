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
  local function OnAttach(first, bufnr)
    lsp_common.on_attach(first, bufnr, true)
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
