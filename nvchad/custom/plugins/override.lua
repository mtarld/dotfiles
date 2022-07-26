local M = {}

M.treesitter = {
  ensure_installed = {
    "php",
    "css",
    "html",
    "javascript",
    "json",
    "markdown",
    "org",
    "lua",
    "bash",
  },
  indent = {
    enable = true,
  },
}

M.telescope = {
  pickers = {
    buffers = {
      sort_mru = true,
      ignore_current_buffer = true,
      mappings = {
        i = {
          ["<C-x>"] = "delete_buffer",
        },
        n = {
          ["<C-x>"] = "delete_buffer",
        },
      },
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      grouped = true,
      path = require("custom.plugins.directory").buffer_dir(),
      cwd_to_path = true,
    },
  },
}

M.ui = {
  tabufline = {
    enabled = false,
  },
  statusline = {
    overriden_modules = function()
      return require "custom.plugins.ui.statusline"
    end,
  },
}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",

    -- web
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "json-lsp",

    -- shell
    "shellcheck",
  },
}

return M

