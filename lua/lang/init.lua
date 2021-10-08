local utils = require('utils')

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
local lsp_common = {}

lsp_common.on_attach = function(_, bufnr, no_lsp_format)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- other plugin
  require('plugin/lsp_signature').setup()

  -- Mappings.
  local opts = { noremap = true, silent = true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'gk', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', 'gj', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<space>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  if no_lsp_format ~= true then
    buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  end
end

lsp_common.gen_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  return capabilities
end

for _, lsp in ipairs(servers) do
  require('lang.' .. lsp).setup(lsp_common)
end

local formatters = {
  'lua',
  'beancount',
}
local formatters_types = {}
local formatter_config = {}
for _, lang in ipairs(formatters) do
  formatter_config[lang] = { require('lang.' .. lang).format }
  formatters_types[#formatters_types + 1] = require('lang.' .. lang).filetypes
end
require('formatter').setup({
  filetype = formatter_config,
})

local formatters_types_str = table.concat(formatters_types, ',')
utils.au.group('FormatAutogroup', {
  { 'BufWritePost', formatters_types_str, ':FormatWrite' },
  {
    'BufEnter',
    formatters_types_str,
    function()
      vim.api.nvim_buf_set_keymap(0, 'n', '<Space>f', ':Format<CR>', { noremap = true, silent = true })
    end,
  },
})
