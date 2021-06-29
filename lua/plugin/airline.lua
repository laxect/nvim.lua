local setup = function ()
  local u = require('utils')
  u.g('airline_powerline_fonts', 1)
  u.g('airline_theme', 'google_light')
  u.g('airline_extensions', {'tabline', 'branch'})
end

return setup
