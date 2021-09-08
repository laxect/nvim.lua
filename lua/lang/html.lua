local M = {}
M.setup = function(lsp_common)
    require'lspconfig'.html.setup {
        cmd = {"vscode-html-languageserver", "--stdio"},
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.gen_capabilities()
    }
end
return M
