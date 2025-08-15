return {
  {
    "echasnovski/mini.map",
    version = false, -- latest
    config = function()
      local map = require("mini.map")
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.gitsigns(),
          map.gen_integration.diagnostic(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot("4x2"),
        },
        window = {
          side = "right",
          width = 10, -- adjust width to preference
          winblend = 15,
        },
      })
      map.open() -- auto-open on start
    end,
  },
}
