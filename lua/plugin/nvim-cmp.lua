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
    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end
        },
        mapping = {
            -- smart tab
            ['<Tab>'] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-n>'), 'n')
                elseif check_back_space() then
                    vim.fn.feedkeys(t('<Tab>'), 'n')
                elseif vim.fn.call('vsnip#available', {1}) == 1 then
                    vim.fn.feedkeys(t('<Plug>(vsnip-expand-or-jump)'), '')
                else
                    fallback()
                end
            end, {'i', 's'}),
            ['<s-Tab>'] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-p>'), 'n')
                else
                    fallback()
                end
            end, {'i', 's'}),
            ['<C-z>'] = cmp.mapping.scroll_docs(-4),
            ['<C-x>'] = cmp.mapping.scroll_docs(4),
            ['<C-v>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            })
        },
        completion = {completeopt = 'menu,menuone,noinsert'},
        sources = {{name = 'buffer'}, {name = 'nvim_lsp'}, {name = 'path'}}
    }
end

return setup;
