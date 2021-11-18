local M = {}

function M.setup()
  vim.lsp.handlers['textDocument/codeAction'] = require('lspactions').codeaction
  vim.lsp.handlers['textDocument/references'] = require('lspactions').references
  vim.lsp.handlers['textDocument/definition'] = require('lspactions').definition
  vim.lsp.handlers['textDocument/declaration'] = require('lspactions').declaration
  vim.lsp.handlers['textDocument/implementation'] = require('lspactions').implementation
end

return M
