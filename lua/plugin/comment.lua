local M = {}

function M.config()
  require('nvim_comment').setup({
    comment_empty = false,
    -- Should key mappings be created
    create_mappings = false,
  })

  local wk = require('which-key')

  wk.register({ ['gc'] = {
    '<cmd>set operatorfunc=CommentOperator<cr>g@',
    'comment',
  } })
  wk.register({
    ['gc'] = {
      ':<c-u>call CommentOperator(visualmode())<cr>',
      'comment',
    },
  }, {
    mode = 'v',
  })
  wk.register({ ['gcc'] = {
    '<cmd>CommentToggle<cr>',
    'Toggle Comment',
  } })
end

return M
