local config = {
    -- This is mandatory, otherwise border config won't get registered.
    bind = true,
    handler_opts = {border = 'none'},
    hint_enable = false
}

local function setup() require'lsp_signature'.on_attach(config) end

return {setup = setup}
