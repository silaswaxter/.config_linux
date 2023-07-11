local null_ls = require('null-ls')

null_ls.register({
  null_ls.builtins.formatting.lua_format,
})

-- formatting is done with `vim.lsp.buf.format()`; keybinding set in lsp.lua
