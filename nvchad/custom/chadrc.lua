local override = require "custom.plugins.override"
local userPlugins = require "custom.plugins"
local mappings = require "custom.mappings"

local M = {}

M.ui = {
  theme = "onedark",
  hl_override = require("custom.highlights").overriden_hlgroups,
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
    ["goolord/alpha-nvim"] = override.alpha,
  },
}

M.mappings = mappings

return M
