local lsp_common = require('lsp_common')

require'lspconfig'.bashls.setup {
    on_attach = lsp_common.on_attach,
    capabilities = lsp_common.capabilities,
    filetypes = {'sh', 'zsh', 'bash'}
}
