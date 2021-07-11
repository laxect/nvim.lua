local lsp_common = require('lsp_common')

require'lspconfig'.clangd.setup {on_attach = lsp_common.on_attach}
