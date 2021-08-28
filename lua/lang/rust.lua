local lsp_common = require('lsp_common')

require'lspconfig'.rust_analyzer.setup {
    on_attach = lsp_common.on_attach,
    capabilities = lsp_common.capabilities,
    settings = {["rust-analyzer"] = {checkOnSave = {command = 'clippy'}}}
}
