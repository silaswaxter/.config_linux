vim.g.mapleader = " "

---- Pane navigation for Wezterm and Neovim
vim.keymap.set({'n', 't'}, '<A-h>', '<CMD>NavigatorLeft<CR>')
vim.keymap.set({'n', 't'}, '<A-l>', '<CMD>NavigatorRight<CR>')
vim.keymap.set({'n', 't'}, '<A-k>', '<CMD>NavigatorUp<CR>')
vim.keymap.set({'n', 't'}, '<A-j>', '<CMD>NavigatorDown<CR>')


---- Language server protocol (LSP)
vim.api.nvim_set_keymap('n', 
                        '<leader>do', 
                        '<cmd>lua vim.diagnostic.open_float()<CR>', 
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 
                        '<leader>dN', 
                        '<cmd>lua vim.diagnostic.goto_prev()<CR>', 
                        { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 
                        '<leader>dn', 
                        '<cmd>lua vim.diagnostic.goto_next()<CR>', 
                        { noremap = true, silent = true })

vim.api.nvim_create_autocmd('User', {
  pattern = 'LspAttached',
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
    bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})
