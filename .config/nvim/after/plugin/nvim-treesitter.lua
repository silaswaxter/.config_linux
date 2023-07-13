require('nvim-treesitter.configs').setup {
  ensure_installed = {
    'c', 'cpp', 'lua', 'python', 'vimdoc', 'bash', 'gitcommit', 'gitignore',
    'gitattributes', 'make', 'toml', 'yaml', 'markdown_inline'
  },
  highlight = {enable = true, additional_vim_regex_highlighting = false},
  incremental_selection = {enable = false}
  -- TODO: Add shortcuts based on language syntax.
  --
  --      treesitter-textobjects plugin will be useful when doing this
  -- textobjects = {
  --  select = { enable = false },
  --  move = { enable = false },
  --  swap = { enable = false }
  -- }
}
