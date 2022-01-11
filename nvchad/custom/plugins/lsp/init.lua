local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = { "intelephense", "phpactor", "psalm", "tsserver" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      silent = true,
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end

  lspconfig.intelephense.setup {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", ":lua require('custom.plugins.php-cs-fixer').format()<CR>", {})
    end,
  }

  lspconfig.phpactor.setup {
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  }

  lspconfig.psalm.setup {
    root_dir = lspconfig.util.root_pattern('psalm.xml', 'psalm.xml.dist', '.git'),
    on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
    end,
  }

end

return M



