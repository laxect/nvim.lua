local M = {};

M.config = function()
    require'colorizer'.setup {
        css = {rgb_fn = true},
        sass = {rgb_fn = true},
        'html',
        'conf'
    }
end

return M;
