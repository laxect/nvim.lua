local lsp_common = require('lsp_common')

require'lspconfig'.beancount.setup {
    cmd = {"beancount-langserver", "--stdio"},
    on_attach = lsp_common.on_attach,
    init_options = {
        journalFile = "~/Documents/ShimaCount/main.beancount",
        pythonPath = "python3"
    }
};
