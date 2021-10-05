local M = {}

M.config = function()
    local gl = require('galaxyline')
    local gls = gl.section
    local condition = require('galaxyline.condition')

    gl.short_line_list = {' '}

    local colors = require('colors')

    gls.left[1] = {
        statusIcon = {
            provider = function() return '   ' end,
            highlight = {colors.white, colors.blue},
            separator = ' ',
            separator_highlight = {colors.blue, colors.black}
        }
    }

    gls.left[2] = {
        FileName = {
            provider = {'FileName'},
            condition = condition.buffer_not_empty,
            highlight = {colors.white, colors.black},
            separator = ' ',
            separator_highlight = {colors.black, colors.white}
        }
    }

    gls.left[3] = {
        Brand = {
            provider = function()
                return
                    '存在するということは、自分を创造することだ。'
            end,
            condition = function()
                return not condition.buffer_not_empty()
            end,
            highlight = {colors.white, colors.black},
            separator = ' ',
            separator_highlight = {colors.black, colors.white}
        }
    }

    gls.left[4] = {
        current_dir = {
            provider = function()
                local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                return ' ' .. dir_name .. ' '
            end,
            highlight = {colors.black, colors.white}
        }
    }

    local checkwidth = function()
        local squeeze_width = vim.fn.winwidth(0) / 2
        if squeeze_width > 30 then return true end
        return false
    end

    gls.left[5] = {
        DiffAdd = {
            provider = 'DiffAdd',
            condition = checkwidth,
            icon = ' +',
            highlight = {colors.green, colors.white}
        }
    }

    gls.left[6] = {
        DiffModified = {
            provider = 'DiffModified',
            condition = checkwidth,
            icon = '  *',
            highlight = {colors.cyan, colors.white}
        }
    }

    gls.left[7] = {
        DiffRemove = {
            provider = 'DiffRemove',
            condition = checkwidth,
            icon = ' -',
            highlight = {colors.yellow, colors.white}
        }
    }

    gls.left[8] = {
        DiagnosticError = {
            provider = 'DiagnosticError',
            icon = ' x',
            highlight = {colors.red, colors.white}
        }
    }

    gls.left[9] = {
        DiagnosticWarn = {
            provider = 'DiagnosticWarn',
            icon = ' !',
            highlight = {colors.yellow, colors.statusline_bg}
        }
    }

    gls.right[1] = {
        FileType = {
            provider = function()
                local ft = vim.bo.filetype
                return ft .. ' '
            end,
            condition = condition.buffer_not_empty,
            highlight = {colors.red, colors.white}
        }
    }

    gls.right[2] = {
        lsp_status = {
            provider = function()
                local clients = vim.lsp.get_active_clients()
                if next(clients) ~= nil then
                    return ' ' .. '  ' .. ' LSP '
                else
                    return ''
                end
            end,
            highlight = {colors.black, colors.white}
        }
    }

    gls.right[3] = {
        GitIcon = {
            provider = function() return ' ' end,
            condition = condition.check_git_workspace,
            highlight = {colors.red, colors.white}
        }
    }

    gls.right[4] = {
        GitBranch = {
            provider = 'GitBranch',
            condition = condition.check_git_workspace,
            highlight = {colors.black, colors.white}
        }
    }

    gls.right[5] = {
        some_icon = {
            provider = function() return ' ' end,
            highlight = {colors.white, colors.red}
        }
    }

    gls.right[6] = {
        ViMode = {
            provider = function()
                local alias = {
                    n = 'N',
                    i = 'I',
                    c = 'C',
                    V = 'V',
                    [''] = 'V',
                    v = 'V',
                    R = 'R'
                }
                local current_Mode = alias[vim.fn.mode()]

                if current_Mode == nil then
                    return '  T '
                else
                    return '  ' .. current_Mode .. ' '
                end
            end,
            highlight = {colors.white, colors.red}
        }
    }

    gls.right[7] = {
        some_icon2 = {
            provider = function() return '' end,
            highlight = {colors.red, colors.green}
        }
    }

    gls.right[8] = {
        line_percentage = {
            provider = function()
                local current_line = vim.fn.line('.')
                local total_line = vim.fn.line('$')

                if current_line == 1 then
                    return '  Top '
                elseif current_line == vim.fn.line('$') then
                    return '  Bot '
                end
                local result, _ = math.modf((current_line / total_line) * 100)
                return '  ' .. result .. '% '
            end,
            highlight = {colors.white, colors.green}
        }
    }

    gls.short_line_left[1] = {
        FileName = {
            provider = {'FileName'},
            condition = condition.buffer_not_empty,
            highlight = {colors.white, colors.black}
        }
    }
end
return M
