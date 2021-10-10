local M = {}
M.setup = function(lsp_common)
  local root_pattern = require('lspconfig.util').root_pattern
  require('lspconfig').tsserver.setup({
    on_attach = lsp_common.on_attach,
    capabilities = lsp_common.gen_capabilities(),
    root_dir = root_pattern('package.json'),
  })
  require('lspconfig').denols.setup({
    on_attach = lsp_common.on_attach,
    capabilities = lsp_common.gen_capabilities(),
    root_dir = root_pattern('deno.root'),
  })
end
return M
