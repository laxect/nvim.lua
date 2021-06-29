local lsp_common = require('lsp_common')

require'lspconfig'.bashls.setup {
  on_attach = lsp_common.on_attach,
  filetypes = { "sh", "zsh", "bash" }
}
