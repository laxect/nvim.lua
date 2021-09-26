local M = {}
M.setup = function(lsp_common)
    require'lspconfig'.beancount.setup {
        cmd = {'beancount-language-server'},
        on_attach = lsp_common.on_attach,
        capabilities = lsp_common.gen_capabilities(),
        init_options = {
            journalFile = '~/Documents/ShimaCount/main.beancount',
            pythonPath = 'python3'
        }
    };
end
return M
