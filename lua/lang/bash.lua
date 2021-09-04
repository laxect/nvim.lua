local M = {}
M.setup = function(lsp_common)
    require'lspconfig'.bashls.setup {
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.gen_capabilities(),
        filetypes = {'sh', 'zsh', 'bash'}
    }
end
return M
