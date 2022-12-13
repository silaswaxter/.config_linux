-- Boot-strap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 
                                'https://github.com/wbthomason/packer.nvim',
                                install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Hook runs `PackerSync` on file write.
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Plugin Declaration
return require('packer').startup(function(use)
  -- Packer manages itself
  use { "wbthomason/packer.nvim" }

  -- Theming
  use { "ellisonleao/gruvbox.nvim" }

  -- Render Images
  use {
    'edluffy/hologram.nvim',
    config = [[require("plugin-config.hologram")]],
  }

  -- Rename files and directories using vim
  use {
    'qpkorr/vim-renamer',
  }

  -- LSP
  use {
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  }
  use {
    "neovim/nvim-lspconfig",
    config = [[require("plugin-config.nvim-lspconfig")]],
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = [[require("plugin-config.null-ls")]],
  }

  -- TODO: The following are from my old configuration. Before adding these 
  -- again, make sure you understand all the capabilities a plugin offers. For 
  -- example, git gutter allows staging of hunks and viewing changes.
    -- gitgutter https://github.com/airblade/vim-gitgutter
    -- suda vim (haven't used in long time)

  -- Sync packer after boot-strapping. Section MUST be last in function.
  if packer_bootstrap then
    require('packer').sync()
  end
end)
