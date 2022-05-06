local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"
  -- local servers = { "intelephense", "phpactor", "psalm", "tsserver" }
  local servers = { "phpactor" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = function(client, bufnr)
        attach(client, bufnr)

        if lsp == "phpactor" then
          vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", ":lua require('custom.plugins.php-cs-fixer').format()<CR>", {})
        end
      end,
      capabilities = capabilities,
    }
  end
end

return M
