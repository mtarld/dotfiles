local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)

  -- lsp

  use {
    "neovim/nvim-lspconfig",
    module = "lspconfig",

    config = function()
      require "custom.plugins.lspconfig"
    end,

    setup = function()
      require("core.utils").packer_lazy_load "nvim-lspconfig"
      vim.defer_fn(function()
        vim.cmd 'if &ft == "packer" | echo "" | else | silent! e %'
      end, 0)
    end,
    opt = true,
  }

  use {
    "ray-x/lsp_signature.nvim",
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.signature"
    end,
  }

  -- autocompletion

  use {
    "rafamadriz/friendly-snippets",
    event = "InsertEnter",
  }

  use {
    "hrsh7th/nvim-cmp",
    after = "friendly-snippets",
    config = function()
      require "custom.plugins.cmp"
    end,
  }

  use {
    "L3MON4D3/LuaSnip",
    wants = "friendly-snippets",
    after = "nvim-cmp",
    config = function()
      local luasnip = require "luasnip"
      luasnip.config.set_config {
        history = true,
        updateevents = "TextChanged,TextChangedI",
      }
      require("luasnip/loaders/from_vscode").load()
    end,
  }

  use {
    "saadparwaiz1/cmp_luasnip",
    after = "LuaSnip",
  }

  use {
    "hrsh7th/cmp-nvim-lua",
    after = "cmp_luasnip",
  }

  use {
    "hrsh7th/cmp-nvim-lsp",
    after = "cmp-nvim-lua",
  }

  use {
    "hrsh7th/cmp-buffer",
    after = "cmp-nvim-lsp",
  }

  use {
    "hrsh7th/cmp-path",
    after = "cmp-buffer",
  }

  use {
    "windwp/nvim-autopairs",
    after = "nvim-cmp",
    config = function()
      local autopairs = require "nvim-autopairs"
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"

      autopairs.setup { fast_wrap = {} }

      local cmp = require "cmp"
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  }

  -- telescope

  use {
    "nvim-telescope/telescope-live-grep-raw.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "live_grep_raw"
    end,
  }

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "file_browser"
    end,
  }

  use {
    "nvim-telescope/telescope-project.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "project"
    end,
  }

  use {
    "nvim-telescope/telescope-fzf-native.nvim",
    after = "telescope.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  }

  -- window

  use {
    "szw/vim-maximizer",
    cmd = "MaximizerToggle",
  }

  -- git

  use {
    "tpope/vim-fugitive",
    cmd = "Git",
  }
end)
