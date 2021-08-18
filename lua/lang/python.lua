local lsp_common = require('lsp_common')

require'lspconfig'.pyright.setup {on_attach = lsp_common.on_attach}
