local M = {}

M.ui = {
  theme = "onedark",
}

M.options = {
  shiftwidth = 4,
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
      buffers = "<leader> ",
      git_status = "<leader>gg",
    },
    comment = {
      toggle = "<leader>cl",
    },
  },

  -- lspconfig = {
  --   declaration = "gD",
  --   definition = "gd",
  --   hover = "K",
  --   implementation = "<leader>ci",
  --   signature_help = "gk",
  --   add_workspace_folder = "<leader>wa",
  --   remove_workspace_folder = "<leader>wr",
  --   list_workspace_folders = "<leader>wl",
  --   type_definition = "<leader>D",
  --   rename = "<leader>rn",
  --   code_action = "<leader>ca",
  --   references = "gr",
  --   float_diagnostics = "ge",
  --   goto_prev = "[d",
  --   goto_next = "]d",
  --   set_loclist = "<leader>q",
  --   formatting = "<leader>fm",
  -- },

  terminal = {
    pick_term = "<leader>cf",
    new_horizontal = "<leader>ch",
    new_vertical = "<leader>cv",
    new_window = "<leader>cc",
  },
}

return M
