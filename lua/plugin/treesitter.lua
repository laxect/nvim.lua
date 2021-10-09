local M = {}

function M.config()
  require('nvim-treesitter.configs').setup({
    ensure_installed = 'maintained',
    highlight = { enable = true },
    incremental_selection = {
      enable = false,
    },
    indent = { enable = true },
    textobjects = {
      select = {
        enable = true,
        -- Automatically jump forward to textobj, similar to targets.vim
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      swap = {
        enable = true,
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
      },
    },
  })
end

local wk = require('which-key')

wk.register({
  a = {
    function()
      require('nvim-treesitter.textobjects.swap').swap_next('@parameter.inner')
    end,
    'Swap Args with Next',
  },
  A = {
    function()
      require('nvim-treesitter.textobjects.swap').swap_previous('@parameter.inner')
    end,
    'Swap Args with Prev',
  },
}, {
  prefix = '<Leader>',
})

wk.register({
  f = {
    name = 'Function Move',
    s = {
      function()
        require('nvim-treesitter.textobjects.move').goto_next_start('@function.outer')
      end,
      "Goto Next Function's Start",
    },
    e = {
      function()
        require('nvim-treesitter.textobjects.move').goto_next_end('@function.outer')
      end,
      "Goto Next Function's End",
    },
    p = {
      function()
        require('nvim-treesitter.textobjects.move').goto_previous_start('@function.outer')
      end,
      "Goto Previous Function' Start",
    },
  },
  c = {
    name = 'Class Move',
    s = {
      function()
        require('nvim-treesitter.textobjects.move').goto_next_start('@class.outer')
      end,
      "Goto Next Class's Start",
    },
    e = {
      function()
        require('nvim-treesitter.textobjects.move').goto_next_end('@class.outer')
      end,
      "Goto Next Class's End",
    },
    p = {
      function()
        require('nvim-treesitter.textobjects.move').goto_previous_start('@class.outer')
      end,
      "Goto Previous Class' Start",
    },
  },
}, {
  prefix = 'm',
})

return M
