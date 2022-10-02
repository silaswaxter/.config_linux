local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.diagnostics.vale, 
}

null_ls.setup({ sources = sources})
