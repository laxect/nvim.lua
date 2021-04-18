vim.g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp', 'path' } },
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

local servers = { "lua", "rust", "haskell", "js", "bash" }
for _, lsp in ipairs(servers) do
  require ("lang."..lsp)
end

vim.cmd([[autocmd BufEnter * lua require'completion'.on_attach({
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'fuzzy'},
})]])
