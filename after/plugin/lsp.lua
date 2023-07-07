-- ABOUT: setup language server protocol (LSP)

local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

mason.setup({})
mason_lspconfig.setup({
  ensure_installed = { 'lua_ls', 'clangd' }
})

-- Using this implementation over mason_lspconfig.setup_handlers() to reduce
-- coupling between lspconfig and mason; if a server not installed by mason is
-- used, it'll require a direct setup call with lspconfig. Although similar I
-- don't want to navigate different APIs.
for _, lsp_server_name in ipairs(mason_lspconfig.get_installed_servers()) do
  if lsp_server_name == 'lua_ls' then
    lspconfig[lsp_server_name].setup({
      settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
      },
      -- advertise additional capabilities offered by cmp_nvim_lsp
      capabilities= cmp_nvim_lsp.default_capabilities()
    })
  -- default handler
  else
    lspconfig[lsp_server_name].setup({
      -- advertise additional capabilities offered by cmp_nvim_lsp
      capabilities= cmp_nvim_lsp.default_capabilities(),
    })
  end
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    -- Buffer local mappings.
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gtd', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)

    vim.api.nvim_buf_create_user_command(ev.buf, 'LspFormat', function()
      vim.lsp.buf.format()
    end, {desc = 'Format buffer with language server'})
  end,
})
