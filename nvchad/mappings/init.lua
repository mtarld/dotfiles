local M = {}

M.general = {
  n = {
    ["<leader>qq"] = {
      function()
        vim.cmd("xa!")
      end,
      "quit nvim",
    },
    ["<leader>fs"] = {
      function()
        vim.cmd("w")
      end,
      "save file",
    },
  },
}

M.windows = {
  n = {
    ["<leader>w/"] = {
      function()
        vim.cmd("vsp")
      end,
      "split window vertically",
    },
    ["<leader>w_"] = {
      function()
        vim.cmd("sp")
      end,
      "split window horizontally",
    },
    ["<leader>wd"] = { "<C-w>q", "close window" },
    ["<leader>wl"] = { "<C-w>l", "window right" },
    ["<leader>wh"] = { "<C-w>h", "window left" },
    ["<leader>wj"] = { "<C-w>j", "window bottom" },
    ["<leader>wk"] = { "<C-w>k", "window top" },
    ["<leader>wm"] = {
      function()
        require("maximize").toggle()
      end,
      "maximize current window",
    },
    ["<C-l>"] = {
      function()
        vim.cmd("TmuxNavigateRight")
      end,
      "window right (tmux included)",
    },
    ["<C-h>"] = {
      function()
        vim.cmd("TmuxNavigateLeft")
      end,
      "window left (tmux included)",
    },
    ["<C-j>"] = {
      function()
        vim.cmd("TmuxNavigateDown")
      end,
      "window bottom (tmux included)",
    },
    ["<C-k>"] = {
      function()
        vim.cmd("TmuxNavigateUp")
      end,
      "window top (tmux included)",
    },
  },
}

M.buffers = {
  n = {
    ["<leader>b<TAB>"] = {
      function()
        require("custom.plugins.buffer").switch_to_last_buffer()
      end,
      "last buffer",
    },
    ["<leader>bd"] = {
      function()
        require("nvchad_ui.tabufline").close_buffer()
      end,
      "close buffer",
    },
    ["<leader>bo"] = {
      function()
        require("custom.plugins.buffer").close_other_buffers()
      end,
      "close other buffers",
    },
    ["<leader>bx"] = {
      function()
        vim.cmd("Scratch")
      end,
      "open scratch buffer"
    },
    ["<leader>px"] = {
      function()
        vim.cmd("e" .. vim.fn.stdpath("config") .. "/lua/custom/plugins/buffer/projects.org")
      end,
      "open project buffer",
    },
    ["<TAB>"] = nil,
    ["<S-Tab>"] = nil,
  },
}

M.directory = {
  n = {
    ["<leader>oo"] = {
      function()
        require("custom.plugins.directory").cwd_root()
      end,
      "set current directory to root",
    },
    ["<leader>o-"] = {
      function()
        require("custom.plugins.directory").cwd_buffer()
      end,
      "set current directory to buffer one",
    },
    ["<leader>^"] = {
      function()
        require("custom.plugins.directory").cwd_parent()
      end,
      "set current directory to parent",
    },
    ["<leader>yf"] = {
      function()
        vim.cmd("let @+=@%")
      end,
      "copy current file path",
    }
  },
}

M.telescope = {
  n = {
    ["<leader>."] = {
      function()
        vim.cmd("Telescope live_grep")
      end,
      "find in files",
    },
    ["<C-s>"] = {
      function()
        vim.cmd("Telescope current_buffer_fuzzy_find")
      end,
      "find in buffer",
    },
    ["<leader>bb"] = {
      function()
        vim.cmd("Telescope buffers")
      end,
      "find buffers",
    },
    ["<leader>fr"] = {
      function()
        vim.cmd("Telescope oldfiles")
      end,
      "find old files",
    },
    ["<leader>gb"] = {
      function()
        vim.cmd("Telescope git_branches")
      end,
      "find git branches",
    },
    ["<leader>gc"] = {
      function()
        vim.cmd("Telescope git_commits")
      end,
      "find git commits",
    },
    ["<leader>gl"] = {
      function()
        vim.cmd("Telescope git_bcommits")
      end,
      "find git branch commits",
    },
    ["<leader> "] = {
      function()
        vim.cmd("Telescope find_files")
      end,
      "find files",
    },
    ["<leader>ff"] = {
      function()
        require("telescope").extensions.file_browser.file_browser({
          hidden = true,
          grouped = true,
          path = require("custom.plugins.directory").buffer_dir(),
          cwd_to_path = true,
        })
      end,
      "file browser",
    },
    ["<leader>/"] = {
      function()
        vim.cmd("Telescope live_grep no_ignore=true")
      end,
      "find in files (ignored files included)",
    },
    ["<leader>cp"] = {
      function()
        vim.cmd("PhpactorContextMenu")
      end,
      "open phpactor context menu",
    },
    ["<leader>§"] = {
      function()
        vim.cmd("Telescope live_grep_args")
      end,
      "find in files (with ripgrep args)",
    },
    ["gd"] = {
      function()
        vim.cmd("Telescope lsp_definitions")
      end,
      "find LSP definitions",
    },
    ["gr"] = {
      function()
        vim.cmd("Telescope lsp_references")
      end,
      "find LSP references",
    },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = {
      function()
        vim.cmd("Git")
      end,
      "git status",
    },
    ["<leader>gf"] = {
      function()
        vim.cmd("diffget //2")
      end,
      "apply left diff",
    },
    ["<leader>gh"] = {
      function()
        vim.cmd("diffget //3")
      end,
      "apply right diff",
    },
    ["<leader>gs"] = {
      function()
        require("gitsigns").stage_hunk()
      end,
      "stage hunk",
    },
    ["<leader>gu"] = {
      function()
        require("gitsigns").undo_stage_hunk()
      end,
      "unstage hunk",
    },
    ["<leader>gr"] = {
      function()
        require("gitsigns").reset_hunk()
      end,
      "reset hunk",
    },
    ["<leader>gp"] = {
      function()
        require("gitsigns").preview_hunk()
      end,
      "preview hunk",
    },
    ["<leader>gd"] = {
      function()
        require("custom.plugins.git").compare()
      end,
      "compare with another branch",
    },
  },
}

M.http = {
  n = {
    ["<leader>hr"] = {
      function()
        require("rest-nvim").run()
      end,
      "run HTTP request",
    },
  },
}

M.comment = {
  n = {
    ["<leader>cl"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "toggle comment",
    },
  },
  v = {
    ["<leader>cl"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "toggle comment",
    },
  },
}

M.replacer = {
  n = {
    ["<leader>rr"] = {
      function()
        require("replacer").run({
          rename_files = false,
        })
      end,
      "replace in quickfix list",
    },
  },
}

return M
