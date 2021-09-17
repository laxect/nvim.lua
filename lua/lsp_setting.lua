vim.api.nvim_exec([[
    sign define DiagnosticsSignError text=✗ texthl=DiagnosticsError linehl= numhl=
    sign define DiagnosticsSignWarning text=‼ texthl=DiagnosticsWarning linehl= numhl=
    sign define DiagnosticsSignInformation text=! texthl=DiagnosticsInformation linehl= numhl=
    sign define DiagnosticsSignHint text=🠒 texthl=DiagnosticsHint linehl= numhl=  
]], true)

local servers = {
    'lua', 'rust', 'js', 'bash', 'gdscript', 'beancount', 'clangd', 'yaml',
    'terraform', 'python', 'html', 'json'
}
local lsp_common = require('lsp_common')
for _, lsp in ipairs(servers) do require('lang.' .. lsp).setup(lsp_common) end
