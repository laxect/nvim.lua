local M = {};

M.config = function()
    require'colorizer'.setup {
        css = {rgb_fn = true},
        scss = {rgb_fn = true},
        'html',
        'conf'
    }
end

return M;
