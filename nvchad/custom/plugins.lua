local customPlugins = require "core.customPlugins"

customPlugins.add(function(use)
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
    "szw/vim-maximizer",
    cmd = "MaximizerToggle"
  }
end)
