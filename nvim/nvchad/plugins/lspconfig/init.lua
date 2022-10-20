local attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities
local lspconfig = require "lspconfig"

local servers = {
  -- lua
  "sumneko_lua",

  -- web
  "phpactor",
  -- "psalm", -- disabled because it cannot support intersection types yet
  "tsserver",
  "html",
  "cssls",

  -- configuration
  "jsonls",
  "yamlls",

  -- documentation
  "marksman",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = function(client, bufnr)
      attach(client, bufnr)

      if lsp == "phpactor" then
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", ":lua require('custom.plugins.php-cs-fixer').format()<CR>", {})
      end
    end,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
