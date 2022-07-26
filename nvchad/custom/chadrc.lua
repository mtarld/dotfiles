local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"
local mappings = require "custom.mappings"

local M = {}

M.ui = {
  theme = "onedark",
}

M.plugins = {
  user = userPlugins,

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
    ["NvChad/ui"] = override.ui,
    ["williamboman/mason.nvim"] = override.mason,
  },
}

M.mappings = mappings

return M
