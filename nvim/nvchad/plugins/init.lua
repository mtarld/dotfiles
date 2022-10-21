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
        "lua",
        "bash",
        "twig",
        "http",
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
              ["<C-x>"] = require("custom.plugins.telescope.actions").delete_buffer
            },
            n = {
              ["<C-x>"] = require("custom.plugins.telescope.actions").delete_buffer
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
    run = "composer install --no-dev -o",
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

        -- configuration
        "json-lsp",
        "yaml-language-server",

        -- documentation
        "marksman",

        -- shell
        "shellcheck",
      },
    },
  },

  -- ui

  ["NvChad/ui"] = {
    override_options = {
      tabufline = {
        enabled = false,
      },
      statusline = {
        overriden_modules = function()
          return require("custom.plugins.ui.statusline")
        end,
      },
    },
  },

  ["glepnir/dashboard-nvim"] = {
    config = function ()
      local dashboard = require("dashboard")
      dashboard.custom_header = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      dashboard.header_pad = 15;
      dashboard.footer_pad = 10;

      dashboard.custom_center = {
        {
          icon ="פּ  ",
          shortcut = "<leader>ff",
          desc = "open file browser    ",
          action = "Telescope file_browser hidden=true",
        },
        {
          icon ="  ",
          shortcut = "<leader> ",
          desc = "browse files         ",
          action = "Telescope find_files hidden=true grouped=true",
        },
        {
          icon ="  ",
          shortcut = "<leader>px",
          desc = "open notes           ",
          action = "e" .. vim.fn.stdpath "config" .. "/lua/custom/plugins/buffer/notes.md",
        },
        {
          icon ="  ",
          shortcut = "<leader>qq",
          desc = "quit                 ",
          action = "xa!",
        },

      }

      dashboard.custom_footer = {
        require("custom.plugins.directory").root_dir()
      }
    end
  },

  ["lukas-reineke/indent-blankline.nvim"] = {
    override_options = {
      filetype_exclude = {
        "help",
        "terminal",
        "alpha",
        "packer",
        "lspinfo",
        "TelescopePrompt",
        "TelescopeResults",
        "mason",
        "dashboard",
        "",
      },
    },
  },

  -- search and replace

  ["gabrielpoca/replacer.nvim"] = {
  },

  -- buffers
  ["famiu/bufdelete.nvim"] = {
  },

  -- editorconfig
  ["gpanders/editorconfig.nvim"] = {
  },

  -- markdown
  ["iamcco/markdown-preview.nvim"] = {
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  }
}
