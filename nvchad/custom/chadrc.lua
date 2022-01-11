local M = {}

M.ui = {
  theme = "onedark",
}

M.plugins = {
  status = {
    bufferline = false,
    colorizer = true,
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lsp",
    },
  },
}

M.mappings = {
  misc = {
    save_file = "<leader>fs",
    close_buffer = "<leader>bd",
  },

  plugins = {
    telescope = {
      buffers = "<leader>bb",
      git_status = "<leader>gg",
      find_files = "<leader> ",
    },
    comment = {
      toggle = "<leader>cl",
    },
  },

  terminal = {
    pick_term = "<leader>cf",
    new_horizontal = "<leader>ch",
    new_vertical = "<leader>cv",
    new_window = "<leader>cc",
  },
}

return M
