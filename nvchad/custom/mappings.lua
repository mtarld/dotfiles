local M = {}

M.general = {
  n = {
    ["<leader>qq"] = { ":xa!<CR>", " quit nvim" },
    ["<leader>fs"] = { ":w<CR>", "﬚ save file" },
  },
}

M.windows = {
  n = {
    ["<leader>w/"] = { ":vsp<CR>", "- split window vertically" },
    ["<leader>w_"] = { ":sp<CR>", "| split window horizontally" },
    ["<leader>wd"] = { "<C-w>q", " close window" },
    ["<leader>wl"] = { "<C-w>l", " window right" },
    ["<leader>wh"] = { "<C-w>h", " window left" },
    ["<leader>wj"] = { "<C-w>j", " window bottom" },
    ["<leader>wk"] = { "<C-w>k", " window top" },
    ["<leader>wm"] = { ":MaximizerToggle<CR>", "  maximize window" },
    ["<leader>ws"] = { ":lua require('shade').toggle()<CR>", "  toggle window shading" },
    ["<C-l>"] = { ":TmuxNavigateRight<CR>", " window right (tmux included)" },
    ["<C-h>"] = { ":TmuxNavigateLeft<CR>", " window left (tmux included)" },
    ["<C-j>"] = { ":TmuxNavigateDown<CR>", " window bottom (tmux included)" },
    ["<C-k>"] = { ":TmuxNavigateUp<CR>", " window top (tmux included)" },
  },
}

M.buffers = {
  n = {
    ["<leader>b<TAB>"] = {
      function()
        require('custom.plugins.buffer').switch_to_last_buffer()
      end,
      " last buffer",
    },
    ["<leader>bd"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>bo"] = { ":silent! w|%bd|e#|bd#<CR>", " close other buffers" },
    ["<leader>bx"] = { ":Scratch<CR>", "烙 open scratch buffer" },
    ["<leader>px"] = { ":e" .. vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/projects.org<CR>", "烙 open project buffer" },
    ["<TAB>"] = { "" },
    ["<S-Tab>"] = { "" },
  },
}

M.directory = {
  n = {
    ["<leader>oo"] = { ":lua require('custom.plugins.directory').cwd_root()<CR>", "Set current directory to root" },
    ["<leader>o-"] = { ":lua require('custom.plugins.directory').cwd_buffer()<CR>", "Set current directory to buffer one" },
    ["<leader>^"] = { ":lua require('custom.plugins.directory').cwd_parent()<CR>", "Set current directory to parent" },
  },
}

M.telescope = {
  n = {
    ["<leader>."] = { ":Telescope live_grep<CR>", "  find in files" },
    ["<C-s>"] = { ":Telescope current_buffer_fuzzy_find<CR>", "  find in buffer" },
    ["<leader>bb"] = { ":Telescope buffers<CR>", "  find buffers" },
    ["<leader>fr"] = { ":Telescope oldfiles<CR>", "  find old files" },
    ["<leader>gb"] = { ":Telescope git_branches<CR>", "  find git branches" },
    ["<leader>gc"] = { ":Telescope git_commits<CR>", "  find git commits" },
    ["<leader>gl"] = { ":Telescope git_bcommits<CR>", "  find git branch commits" },
    ["<leader> "] = { ":Telescope find_files<CR>", "  find files" },
    ["<leader>ff"] = {
      function()
        require("telescope").extensions.file_browser.file_browser({
          hidden = true,
          grouped = true,
          path = require("custom.plugins.directory").buffer_dir(),
          cwd_to_path = true,
        })
      end,
      "  file browser",
    },
    ["<leader>/"] = {
      function()
        require("telescope.builtin").live_grep({
          additional_args = function ()
            return { '--no-ignore' }
          end
        })
      end,
      "  find in files (ignored files included)",
    },
    ["<leader>§"] = { ":Telescope live_grep_args<CR>", "  find in files (with ripgrep args)" },
  },
}

M.git = {
  n = {
    ["<leader>gg"] = { "<cmd> Git<CR>", "Open git window" },
    ["<leader>gf"] = { "<cmd> diffget //2<CR>", "Apply left diff" },
    ["<leader>gh"] = { "<cmd> diffget //3<CR>", "Apply right diff" },
    ["<leader>gn"] = { ":lua require('gitsigns').next_hunk()<CR>", "Next hunk" },
    ["<leader>gN"] = { ":lua require('gitsigns').prev_hunk()<CR>", "Prev hunk" },
    ["<leader>gs"] = { ":lua require('gitsigns').stage_hunk()<CR>", "Stage hunk" },
    ["<leader>gu"] = { ":lua require('gitsigns').undo_stage_hunk()<CR>", "Unstage hunk" },
    ["<leader>gS"] = { ":lua require('gitsigns').stage_buffer()<CR>", "Stage buffer" },
    ["<leader>gU"] = { ":lua require('gitsigns').reset_buffer_index() <CR>", "Reset buffer index" },
    ["<leader>gr"] = { ":lua require('gitsigns').reset_hunk()<CR>", "Reset hunk" },
    ["<leader>gp"] = { ":lua require('gitsigns').preview_hunk()<CR>", "Preview hunk" },
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
        require('rest-nvim').run()
      end,
      "蘒  run HTTP request",
    },
  },
}

M.lsp = {
  n = {
    ["<leader>rn"] = {
      function()
        vim.lsp.buf.rename()
      end,
    },
  },
}

M.comment = {
  n = {
    ["<leader>cl"] = {
      function()
        require("Comment.api").toggle_current_linewise()
      end,
      "蘒  toggle comment",
    },
  },
  v = {
    ["<leader>cl"] = {
      "<ESC><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>",
      "蘒  toggle comment",
    },
  },
}

return M
