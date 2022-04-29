local M = {}

local overriden_plugin_config = require "custom.plugins.configs"

M.ui = {
  theme = "onedark",
}

M.plugins = {
  install = require "custom.plugins",
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  default_plugin_config_replace = {
    nvim_treesitter = overriden_plugin_config.treesitter,
    telescope = overriden_plugin_config.telescope,
  },
  status = {
    colorizer = true,
  },
}

M.mappings = {
  misc = {
    save_file = "<leader>fs",
    close_buffer = "<leader>bd",
  },

  plugins = {
    telescope = {
      find_files = "<leader> ",
    },
    comment = {
      toggle = "<leader>cl",
    },
    lspconfig = {
      list_workspace_folders = "",
    },
  },

  terminal = {
    pick_term = "<leader>cf",
    new_horizontal = "<leader>c_",
    new_vertical = "<leader>c/",
    new_window = "<leader>cc",
  },
}

return M
