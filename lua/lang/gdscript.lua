local M = {}
M.setup = function(lsp_common)
    require'lspconfig'.gdscript.setup {
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.gen_capabilities()
    }
end
return M
