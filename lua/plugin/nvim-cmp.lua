local M = {}
M.config = function()
  local luasnip = require('luasnip')
  luasnip.config.setup({ history = false })
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
      ['<C-p>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-y>'] = cmp.mapping(cmp.mapping.confirm(), { 'i', 'c' }),
      ['<C-e>'] = function(_)
        cmp.mapping.close()
        if vim.g.copilot_enable then
          local copilot_keys = vim.fn['copilot#Accept']('')
          if copilot_keys ~= '' then
            vim.api.nvim_feedkeys(copilot_keys, 'i', true)
          end
        end
      end,
      -- smart tab
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, {
        'i',
        'c',
      }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        'i',
        'c',
      }),
      ['<CR>'] = cmp.mapping({
        i = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
        c = function(fallback)
          if cmp.visible() then
            cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace })
          end
          fallback()
        end,
      }),
    },
    completion = { completeopt = 'menu,menuone,noinsert' },
    sources = { { name = 'luasnip' }, { name = 'nvim_lsp' }, { name = 'path' } },
  })

  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' },
    }, {
      { name = 'cmdline' },
    }),
  })

  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' },
    },
  })

  require('nvim-autopairs').setup({})
  -- If you want insert `(` after select function or method item
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

  -- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
  cmp_autopairs.lisp[#cmp_autopairs.lisp + 1] = 'racket'
end

return M
