-- TODO see which config could be overriden (telescope's for example)

local M = {}

M.ui = {
  theme = "onedark",
}

M.plugins = {
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
