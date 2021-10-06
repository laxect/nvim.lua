vim.api.nvim_exec(
  [[
    sign define DiagnosticsSignError text=✗ texthl=DiagnosticsError linehl= numhl=
    sign define DiagnosticsSignWarning text=‼ texthl=DiagnosticsWarning linehl= numhl=
    sign define DiagnosticsSignInformation text=! texthl=DiagnosticsInformation linehl= numhl=
    sign define DiagnosticsSignHint text=🠒 texthl=DiagnosticsHint linehl= numhl=  
]],
  true
)

local servers = {
  'lua',
  'rust',
  'js',
  'bash',
  'gdscript',
  'clangd',
  'yaml',
  'terraform',
  'python',
  'html',
  'json',
  'css',
}
local lsp_common = require('lsp_common')
for _, lsp in ipairs(servers) do
  require('lang.' .. lsp).setup(lsp_common)
end

local formatters = {
  'lua',
  'beancount',
}
local formatter_config = {}
for _, lang in ipairs(formatters) do
  formatter_config[lang] = { require('lang.' .. lang).format }
end
require('formatter').setup({
  filetype = formatter_config,
})
vim.api.nvim_exec(
  'augroup FormatAutogroup autocmd! autocmd BufWritePost *.beancount,*.lua FormatWrite augroup END',
  true
)
