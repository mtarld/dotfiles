return {

  -- telescope

  {
    "nvim-telescope/telescope-live-grep-raw.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "live_grep_raw"
    end,
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  },

  {
    "nvim-telescope/telescope-project.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "project"
    end,
  },

  {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },

  -- window

  {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
  },

  {
    "christoomey/vim-tmux-navigator",
  },

  -- git

  {
    "tpope/vim-fugitive",
    cmd = "Git",
  },

  -- scratch

  {
    "mtth/scratch.vim",
    config = function()
      vim.g.scratch_top = false
      vim.g.scratch_persistence_file = vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/scratch"
      vim.g.scratch_no_mappings = true
      vim.g.scratch_height = 20
    end,
  },

  -- http

  {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" }, config = function()
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
    end
  },

}
