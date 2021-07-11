local lsp_common = require('lsp_common')

require'lspconfig'.gdscript.setup {on_attach = lsp_common.on_attach}
