return {

  -- telescope

  ["nvim-telescope/telescope-live-grep-args.nvim"] = {
    module = "telescope",
  },

  ["nvim-telescope/telescope-file-browser.nvim"] = {
    module = "telescope",
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    module = "telescope",
    run = "make",
  },

  -- window

  ["szw/vim-maximizer"] = {
    cmd = "MaximizerToggle",
  },

  ["christoomey/vim-tmux-navigator"] = {
  },

  ["sunjon/shade.nvim"] = {
    config = function()
      require("shade").setup({
        overlay_opacity = 50,
        opacity_step = 1,
        exclude_filetypes = { "NvimTree" },
      })
    end,
  },

  -- git

  ["tpope/vim-fugitive"] = {
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
    config = function()
      require("rest-nvim").setup({
        result_split_horizontal = true,
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
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- org mode
  ["nvim-orgmode/orgmode"] = {
    config = function()
      require('orgmode').setup_ts_grammar()
      require("orgmode").setup({
        win_split_mode = 'float',
        org_default_notes_file = '~/Documents/perso/dotfiles/nvchad/custom/plugins/buffer/projects.org',
        org_agenda_files = {
          '~/Documents/perso/dotfiles/nvchad/custom/plugins/buffer/projects.org',
        },
        org_todo_keywords = {'TODO(t)', 'NEXT(n)', 'IN_PROGRESS(i)', 'WAITING(w)', 'POSTPONED(p)', '|', 'DONE(d)', 'CANCELED(c)'},
        org_todo_keyword_faces = {
          ['TODO'] = ':foreground #E06C75 :weight bold',
          ['NEXT'] = ':foreground #00AFFF :weight bold',
          ['IN_PROGRESS'] = ':foreground #80A469 :weight bold',
          ['WAITING'] = ':foreground #D19A66 :weight bolde',
          ['POSTPONED'] = ':foreground #808080 :weight bold',
          ['CANCELED'] = ':foreground #707070 :weight bold',
        },
        org_hide_leading_stars = true,
      })
    end,
  },

  -- dashboard

  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  -- search and replace
  ["gabrielpoca/replacer.nvim"] = {
  },
}
