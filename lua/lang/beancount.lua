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
    cmd = { 'beancount-language-server' },
    on_attach = on_attach,
    capabilities = lsp_common.gen_capabilities(),
    init_options = {
      journal_file = '/home/gyara/Documents/ShimaCount/main.beancount',
      python_path = 'python3',
    },
  })
end

return M
