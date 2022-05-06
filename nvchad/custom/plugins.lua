return {

  -- telescope
  ["nvim-telescope/telescope.nvim"] = {
    setup = function()
      require("core.mappings").telescope()

      local map = require("core.utils").map
      map("n", "<leader>.", ":Telescope live_grep<CR>")
      map("n", "<leader>/", function()
        require("telescope.builtin").live_grep({
          additional_args = function ()
            return { '--no-ignore' }
          end,
        })
      end)
      map("n", "<C-s>", ":Telescope current_buffer_fuzzy_find<CR>")
      map("n", "<leader>bb", ":Telescope buffers<CR>")
      map("n", "<leader>fr", ":Telescope oldfiles<CR>")
      map("n", "<leader>gb", ":Telescope git_branches<CR>")
      map("n", "<leader>gc", ":Telescope git_commits<CR>")
      map("n", "<leader>gl", ":Telescope git_bcommits<CR>")
      map("n", "<leader> ", ":Telescope find_files<CR>")
    end,
  },

  ["nvim-telescope/telescope-live-grep-raw.nvim"] = {
    after = "telescope.nvim",
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>§", ":Telescope live_grep_raw<CR>")
    end,
    config = function()
      require("telescope").load_extension "live_grep_raw"
    end,
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    after = "telescope.nvim",
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>ff", function()
        require("telescope").extensions.file_browser.file_browser({
          follow = true,
          hidden = true,
          no_ignore = true,
          path = require("custom.plugins.directory").buffer_dir(),
        })
      end)
    end,
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },

  ["nvim-telescope/telescope-project.nvim"] = {
    after = "telescope.nvim",
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>pp", ":Telescope project<CR>")
    end,
    config = function()
      require("telescope").load_extension "project"
    end,
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  -- window

  ["szw/vim-maximizer"] = {
    cmd = "MaximizerToggle",
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>wm", ":MaximizerToggle<CR>")
    end,
  },

  ["christoomey/vim-tmux-navigator"] = {
  },

  -- git

  ["tpope/vim-fugitive"] = {
    cmd = "Git",
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>gg", ":Git<CR>")
      map("n", "<leader>gf", ":diffget //2<CR>")
      map("n", "<leader>gh", ":diffget //3<CR>")
    end,
  },

  ["lewis6991/gitsigns.nvim"] = {
    setup = function()
      require("core.utils").packer_lazy_load "gitsigns.nvim"
      local map = require("core.utils").map
      map("n", "<leader>gn", ":lua require('gitsigns').next_hunk()<CR>")
      map("n", "<leader>gN", ":lua require('gitsigns').prev_hunk()<CR>")
      map("n", "<leader>gs", ":lua require('gitsigns').stage_hunk()<CR>")
      map("n", "<leader>gu", ":lua require('gitsigns').undo_stage_hunk()<CR>")
      map("n", "<leader>gS", ":lua require('gitsigns').stage_buffer()<CR>")
      map("n", "<leader>gU", ":lua require('gitsigns').reset_buffer_index() <CR>")
      map("n", "<leader>gr", ":lua require('gitsigns').reset_hunk()<CR>")
      map("n", "<leader>gp", ":lua require('gitsigns').preview_hunk()<CR>")
    end,
  },

  -- scratch

  ["mtth/scratch.vim"] = {
    config = function()
      vim.g.scratch_top = false
      vim.g.scratch_persistence_file = vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/scratch"
      vim.g.scratch_no_mappings = true
      vim.g.scratch_height = 20
    end,
  },

  -- http

  ["NTBBloodbath/rest.nvim"] = {
    requires = { "nvim-lua/plenary.nvim" },
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>hr", ":lua require('rest-nvim').run()<CR>")
    end,
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = false,
        skip_ssl_verification = true,
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end,
  },

  -- lsp
  ["neovim/nvim-lspconfig"] = {
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end)
    end,
  },

  -- comment
  ["numToStr/Comment.nvim"] = {
    setup = function()
      local map = require("core.utils").map
      map("n", "<leader>cl", "<cmd> :lua require('Comment.api').toggle_current_linewise()<CR>")
      map("v", "<leader>cl", "<esc><cmd> :lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<CR>")
    end,
  },
}
