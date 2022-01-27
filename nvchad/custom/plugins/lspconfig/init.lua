require("plugins.configs.others").lsp_handlers()

local function on_attach(_, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
  require("core.mappings").lspconfig()
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local lspconfig = require "lspconfig"
local servers = { "intelephense", "phpactor", "psalm", "tsserver" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
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
