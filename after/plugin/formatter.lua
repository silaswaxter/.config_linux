local formatter = require('formatter')
local util = require('formatter.util') -- utilities for creating configurations

-- see https://github.com/mhartington/formatter.nvim/issues/253
local my_luaformat = require('formatter.filetypes.lua').luaformat()
my_luaformat.args = {}

formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,

  filetype = {
    -- configure `Koihik/LuaFormatter` via files because CLI parameters are 
    -- prioritized over configuration files; don't want my defaults to override
    -- a project's local settings.
    lua = {my_luaformat}
  },

  ['*'] = {require('formatter.filetypes.any').remove_trailing_whitespace}
})

vim.keymap.set('n', '<leader>f', vim.cmd.Format)
