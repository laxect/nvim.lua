local setup = function()

    -- tab
    local t = function(str)
        return vim.api.nvim_replace_termcodes(str, true, true, true)
    end

    local check_back_space = function()
        local col = vim.fn.col('.') - 1
        return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s')
    end

    local cmp = require('cmp')
    cmp.setup ({
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
        },
        mapping = {
            -- smart tab
            ["<Tab>"] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t("<C-n>"), "n")
                elseif luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
                elseif check_back_space() then
                    vim.fn.feedkeys(t("<Tab>"), "n")
                else
                    fallback()
                end
            end, {"i", "s"}),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t("<C-p>"), "n")
                elseif luasnip.jumpable(-1) then
                    vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
                else
                    fallback()
                end
            end, {"i", "s"}),
            ['<C-d>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true
            })
        },
        completion = {completeopt = 'menu,menuone,noinsert'},
        sources = {
            {name = 'luasnip'}, {name = 'buffer'}, {name = 'nvim_lsp'},
            {name = 'path'}
        }
    })
end

return setup;
