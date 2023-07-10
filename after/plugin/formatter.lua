local formatter = require('formatter')
local util = require "formatter.util" -- utilities for creating configurations

local my_luaformat = require('formatter.filetypes.lua').luaformat()
table.insert(my_luaformat.args, 1, '--indent-width=2')
table.insert(my_luaformat.args, 1, '--double-quote-to-single-quote')
print(vim.inspect(my_luaformat))


formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    lua = { my_luaformat }
  },

  ["*"] = {
    require("formatter.filetypes.any").remove_trailing_whitespace
  }
})

vim.keymap.set('n', '<leader>f', vim.cmd.Format)
