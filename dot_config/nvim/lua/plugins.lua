-- Packer bootstrap
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({'git', 'clone', '--depth', '1', 
                                'https://github.com/wbthomason/packer.nvim',
                                install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Packer plugin declaration
return require('packer').startup(function(use)
  ---- Appearance
  -- Theme
  use { "ellisonleao/gruvbox.nvim" }

  ---- File/Directory management
  use {
    'qpkorr/vim-renamer',
  }

  ---- Pane navigation for Wezterm and Neovim
  use {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
  }

  ---- Language server protocol (LSP)
--  use {
--    "williamboman/mason-lspconfig.nvim",
--    requires = {
--      "williamboman/mason.nvim",
--      "neovim/nvim-lspconfig",
--    },
--  }
--  use {
--    "neovim/nvim-lspconfig",
--    config = [[require("plugin-config.nvim-lspconfig")]],
--  }

  ---- Packer
  use { "wbthomason/packer.nvim" }
  -- Sync packer after boot-strapping. MUST be last section in function.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
