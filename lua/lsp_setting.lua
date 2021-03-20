-- Use a loop to conveniently both setup defined servers
-- and map buffer local keybindings when the language server attaches

vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'buffers' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}

vim.api.nvim_exec([[
    sign define LspDiagnosticsSignError text=✗ texthl=LspDiagnosticsDefaultError linehl= numhl=
    sign define LspDiagnosticsSignWarning text=‼ texthl=LspDiagnosticsDefaultWarning linehl= numhl=
    sign define LspDiagnosticsSignInformation text=! texthl=LspDiagnosticsDefaultInformation linehl= numhl=
    sign define LspDiagnosticsSignHint text=🠒 texthl=LspDiagnosticsDefaultHint linehl= numhl=  
]], true)

local servers = { "lua", "rust" }
for _, lsp in ipairs(servers) do
  require ("lang."..lsp)
end
