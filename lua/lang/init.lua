local utils = require('utils')

local lsp_status = require('lsp-status')
lsp_status.config({
  kind_labels = {},
  current_function = true,
  show_filename = true,
  diagnostics = true,
  indicator_separator = ' ',
  component_separator = ' ',
  indicator_errors = 'e',
  indicator_warnings = 'w',
  indicator_info = 'i',
  indicator_hint = 'h',
  indicator_ok = 'ok',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
  status_symbol = '  ',
  select_symbol = nil,
  update_interval = 100,
})
lsp_status.register_progress()

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
  'css',
  'lua',
  'rust',
  'bash',
  'html',
  'json',
}
local servers_with_default = {
  'clangd',
  'denols',
  'yamlls',
  'pyright',
  'tsserver',
  'gdscript',
  'terraformls',
}

local lsp_common = {}
lsp_common.on_attach = function(client, bufnr, no_lsp_format)
  local wk = require('which-key')
  lsp_status.on_attach(client)
  -- other plugin
  require('plugin.lsp_signature').setup()
  -- Mappings.
  local opts = { buffer = bufnr }
  wk.register({
    g = {
      D = { '<Cmd>lua vim.lsp.buf.declaration()<CR>', 'Goto Declaration' },
      d = { '<Cmd>lua vim.lsp.buf.definition()<CR>', 'Goto Definition' },
      i = { '<cmd>lua vim.lsp.buf.implementation()<CR>', 'Goto Implementation' },
      r = { '<cmd>lua vim.lsp.buf.references()<CR>', 'Goto Reference' },
      k = { '<cmd>lua vim.diagnostic.goto_prev()<CR>', 'Next Diagnostics' },
      j = { '<cmd>lua vim.diagnostic.goto_next()<CR>', 'Prev Diagnostics' },
    },
    K = { '<Cmd>lua vim.lsp.buf.hover()<CR>', 'Signature' },
    ['<C-k>'] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', 'Signature Help' },
    ['<space>'] = {
      name = 'Lsp Utils',
      D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'Type Definition' },
      r = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'Rename' },
      q = { '<cmd>lua vim.diagnostic.setloclist()<CR>', 'Diagnostics List' },
      e = { '<cmd>lua vim.diagnostic.show_line_diagnostics()<CR>', 'Line Diagnostics' },
      a = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'Code Action' },
    },
  }, opts)
  if no_lsp_format ~= true then
    wk.register({ ['<space>f'] = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'Format' } }, opts)
  end
end

lsp_common.gen_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
  capabilities = vim.tbl_extend('keep', capabilities, lsp_status.capabilities)
  return capabilities
end

for _, lsp in ipairs(servers) do
  require('lang.' .. lsp).setup(lsp_common)
end

for _, lsp in ipairs(servers_with_default) do
  require('lspconfig')[lsp].setup({
    on_attach = lsp_common.on_attach,
    capabilities = lsp_common.gen_capabilities(),
  })
end

local formatters = {
  'lua',
  'beancount',
}
local formatter_config = {}
local formatters_types = {}
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
      local now = vim.api.nvim_get_current_buf()
      require('which-key').register({ ['<space>f'] = { '<cmd>Format<CR>', 'Format' } }, { buffer = now })
    end,
  },
})
