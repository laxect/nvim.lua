local M = {}
M.setup = function(lsp_common)
    require'lspconfig'.rust_analyzer.setup {
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.gen_capabilities(),
        settings = {["rust-analyzer"] = {checkOnSave = {command = 'clippy'}}}
    }
end
return M
