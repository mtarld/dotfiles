local pluginConfigs = require "custom.plugins.configs"

local M = {}

M.ui = {
  theme = "onedark",
}

M.plugins = {
  user = require("custom.plugins"),

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },

  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfigs.treesitter,
    ["nvim-telescope/telescope.nvim"] = pluginConfigs.telescope,
  },

  remove = {
    "akinsho/bufferline.nvim",
  },
}

M.mappings = {
   misc = function()
     require("custom.mappings")
   end,
}

M.options = {
   user = function()
     vim.opt.rtp:append(vim.fn.stdpath "config" .. "/lua/custom/runtime/after")
   end,
}

return M
