local M = {}
M.setup = function()

    -- tab
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local luasnip = require 'luasnip'
    local cmp = require('cmp')
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        },
        mapping = {
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<C-n>'] = cmp.mapping.select_next_item(),
            -- smart tab
            ['<Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-n>'), 'n')
                elseif luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(t('<Plug>luasnip-expand-or-jump'), '')
                else
                    fallback()
                end
            end,
            ['<S-Tab>'] = function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-p>'), 'n')
                elseif luasnip.jumpable(-1) then
                    vim.fn.feedkeys(t('<Plug>luasnip-jump-prev'), '')
                else
                    fallback()
                end
            end,
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            })
        },
        completion = {completeopt = 'menuone,noinsert'},
        sources = {
            {name = 'luasnip'}, {name = 'buffer'}, {name = 'nvim_lsp'},
            {name = 'path'}
        }
    })
end

return M
