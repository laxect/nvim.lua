local M = {}
M.setup = function(lsp_common)
    require'lspconfig'.jsonls.setup {
        cmd = {"vscode-json-languageserver", "--stdio"},
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.gen_capabilities()
    }
end
return M
