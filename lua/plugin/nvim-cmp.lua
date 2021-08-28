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
            ['<S-tab>'] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(t('<C-p>'), 'n')
                else
                    fallback()
                end
            end, {'i', 's'}),
            ['<c-d>'] = cmp.mapping.scroll_docs(-4),
            ['<c-f>'] = cmp.mapping.scroll_docs(4),
            ['<cr>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true
            })
        },

        completion = {completeopt = 'menu,menuone,noinsert'},
        -- you should specify your *installed* sources.
        sources = {{name = 'buffer'}, {name = 'nvim_lsp'}, {name = 'path'}}
    }
end

return setup;
