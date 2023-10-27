-- ABOUT: setup autocompletion
--------------------------------------------------------------------------------
local luasnip = require('luasnip')
local cmp = require('cmp') -- nvim-cmp

local completion_mappings = {
  ['<C-Space>'] = require('cmp').mapping.complete(),

  ['<C-y>'] = require('cmp').mapping.confirm({select = true}),
  ['<C-e>'] = require('cmp').mapping.abort(),

  ['<C-n>'] = require('cmp').mapping.select_next_item(),
  ['<C-p>'] = require('cmp').mapping.select_prev_item(),

  ['<C-u>'] = require('cmp').mapping.scroll_docs(-5),
  ['<C-d>'] = require('cmp').mapping.scroll_docs(5)
}

local function get_cmdline_mapping(cmd_mapping)
  local cmdline_mapping = {}
  for key, value in pairs(cmd_mapping) do cmdline_mapping[key] = {c = value} end
  return cmdline_mapping
end

cmp.setup({
  sources = {
    {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'buffer'}, {name = 'path'},
    {name = 'nvim_lsp_signature_help'}, {name = 'calc'}, {name = 'bazel'}
  },
  snippet = {expand = function(args) luasnip.lsp_expand(args.body) end},
  mapping = completion_mappings
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = get_cmdline_mapping(completion_mappings),
  sources = {{name = 'buffer'}}
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = get_cmdline_mapping(completion_mappings),
  sources = cmp.config.sources({{name = 'path'}}, {
    {name = 'cmdline', option = {ignore_cmds = {'Man', '!'}}}
  })
})


-- TODO: add git sources which will be useful while writing commit messages.
--       1) there is a plugin which will complete convetional commit message
--          key words
--       2) there is a plugin which will completes issues, commits, etc. by
--          parsing github/gitlab
