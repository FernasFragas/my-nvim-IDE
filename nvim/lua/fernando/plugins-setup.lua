-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  -- lua function that plugins may use
  use("nvim-lua/plenary.nvim")

  -- colorscheme
  use("bluz71/vim-nightfly-guicolors")

  -- golang support for vim
  use("fatih/vim-go")

    -- file explorer
  use("nvim-tree/nvim-tree.lua")

  use("nvim-tree/nvim-web-devicons")

  -- finding with telescope
  use({"nvim-telescope/telescope.nvim", branch = "0.1.x"})

  -- managing & installing lsp servers
  use("williamboman/mason.nvim")
  use("williamboman/mason-lspconfig.nvim")

  -- configuring lsp server
  use("neovim/nvim-lspconfig")


  -- autocompletetion\
  use("hrsh7th/cmp-nvim-lsp") -- lsp server autocompletetion
  use("hrsh7th/nvim-cmp") -- completion plugin
  use("hrsh7th/cmp-buffer") -- source for txt in buffer
  use("hrsh7th/cmp-path") -- source for file systems paths
  use({"L3MON4D3/LuaSnip", tag = "v2.*"})
  use("saadparwaiz1/cmp_luasnip") -- 
  use("rafamadriz/friendly-snippets") --
    -- formatting & linting
  use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
  use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls  

  if packer_bootstrap then
    require("packer").sync()
  end
end)
