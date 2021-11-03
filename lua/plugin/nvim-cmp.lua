local M = {}
M.config = function()
  local luasnip = require('luasnip')
  local cmp = require('cmp')
  vim.g.copilot_no_tab_map = true
  vim.g.copilot_assume_mapped = true
  vim.g.copilot_tab_fallback = ''

  cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-y>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-e>'] = cmp.mapping.close(),
      -- smart tab
      ['<Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          local copilot_keys = vim.fn['copilot#Accept']()
          if copilot_keys ~= '' then
            vim.api.nvim_feedkeys(copilot_keys, 'i', true)
          else
            fallback()
          end
        end
      end,
      ['<S-Tab>'] = function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end,
      ['<CR>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    },
    completion = { completeopt = 'menu,menuone,noinsert' },
    sources = { { name = 'luasnip' }, { name = 'nvim_lsp' }, { name = 'path' } },
  })

  ---@diagnostic disable-next-line: undefined-field
  require('cmp').setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })

  ---@diagnostic disable-next-line: undefined-field
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    },
  })

  require('nvim-autopairs').setup({})
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M
