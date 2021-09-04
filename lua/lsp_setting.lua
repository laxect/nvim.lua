vim.api.nvim_exec([[
    sign define LspDiagnosticsSignError text=✗ texthl=LspDiagnosticsDefaultError linehl= numhl=
    sign define LspDiagnosticsSignWarning text=‼ texthl=LspDiagnosticsDefaultWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text=! texthl=LspDiagnosticsDefaultInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text=🠒 texthl=LspDiagnosticsDefaultHint linehl= numhl=  
]], true)

local servers = {
    'lua', 'rust', 'js', 'bash', 'gdscript', 'beancount', 'clangd', 'yaml',
    'terraform', 'python'
}
local lsp_common = require('lsp_common')
for _, lsp in ipairs(servers) do require('lang.' .. lsp).setup(lsp_common) end
