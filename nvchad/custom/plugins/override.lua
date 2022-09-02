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

M.nvimtree = {
  hijack_netrw = false,

  update_focused_file = {
    enable = false,
  },
  renderer = {
    highlight_opened_files = "name",
  },
  view = {
    mappings = {
      list = {
        {
          key = ".",
          action = "live_grep",
          action_cb = require("custom.plugins.nvimtree.actions").live_grep,
        },
        {
          key = "/",
          action = "live_grep_no_ignore",
          action_cb = function ()
            require("custom.plugins.nvimtree.actions").live_grep(true)
          end,
        },
      },
    },
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
      hijack_netrw = true,

      mappings = {
        n = {
          ["."] = require("custom.plugins.telescope.actions").live_grep,
          ["/"] = function (prompt_bufnr)
            require("custom.plugins.telescope.actions").live_grep(prompt_bufnr, true)
          end,
        },
      },
    },
  },

  extensions_list = {
    "themes",
    "terms",
    "live_grep_args",
    "file_browser",
    "fzf",
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

local function alpha_button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    align_text = "left",
    text = txt,
    shortcut = sc,
    cursor = 0,
    width = 70,
    align_shortcut = "left",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

M.alpha = {
  header = {
    val = {
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    },
  },
  buttons = {
    type = "group",
    val = {
      alpha_button("<leader>ff  ", "  " .. require("custom.plugins.directory").root_dir() .. "  ", ":Telescope file_browser<CR>"),
      alpha_button("<leader>px  ", "  notes  ", ":e" .. vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/projects.org<CR>"),
      alpha_button("<leader>qq  ", "  quit  ", ":xa!<CR>"),
    },
  },
}

return M

