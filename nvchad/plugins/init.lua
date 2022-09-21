return {

  -- treesitter

  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = {
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
    },
  },

  -- nvimtree

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = {
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
              action_cb = function (opts)
                opts.no_ignore = true
                require("custom.plugins.nvimtree.actions").live_grep(opts)
              end,
            },
          },
        },
      },
    },
  },

  -- telescope

  ["nvim-telescope/telescope.nvim"] = {
    override_options = {
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
    },
  },

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

  ["declancm/maximize.nvim"] = {
    config = function()
      require('maximize').setup()
    end,
  },

  ["christoomey/vim-tmux-navigator"] = {
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

  ["phpactor/phpactor"] = {
  },

  ["williamboman/mason.nvim"] = {
    override_options = {
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
    },
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

  -- ui

  ["NvChad/ui"] = {
    override_options = {
      tabufline = {
        enabled = false,
      },
      statusline = {
        overriden_modules = function()
          return require "custom.plugins.ui.statusline"
        end,
      },
    },
  },

  ["goolord/alpha-nvim"] = {
    disable = false,
    override_options = function ()
      local dashboard = require("custom.plugins.ui.dashboard")

      return {
        header = {
          val = dashboard.header
        },
        buttons = {
          type = "group",
          val = {
            dashboard.button("<leader>ff  ", "  " .. require("custom.plugins.directory").root_dir() .. "  ", ":Telescope file_browser<CR>"),
            dashboard.button("<leader>px  ", "  notes  ", ":e" .. vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/projects.org<CR>"),
            dashboard.button("<leader>qq  ", "  quit  ", ":xa!<CR>"),
          },
        },
      }
    end
  },

  -- search and replace

  ["gabrielpoca/replacer.nvim"] = {
  },
}
