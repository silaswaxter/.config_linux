local null_ls = require('null-ls')

null_ls.register({
  null_ls.builtins.formatting.lua_format,
  null_ls.builtins.formatting.beautysh,
  null_ls.builtins.formatting.mdformat,
})

-- formatting is done with `vim.lsp.buf.format()`; keybinding set in lsp.lua
