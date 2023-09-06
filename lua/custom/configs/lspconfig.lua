local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

-- Function to reorder imports in JavaScript / TypeScript
local function organize_imports()
  local params = {
    command = "_typescript.organizeImports",
    arguments = {vim.api.nvim_buf_get_name(0)},
  }
  vim.lsp.buf.execute_command(params)
end

-- Configure TypeScript language server to provide JavaScript and TypeScript
-- language auto suggestions. Requires the language servers to be installed
-- in Neovim using :TSInstall typescript javascript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  },
  commands = {
    -- Configure reordering of imports, run using :OrganizeImports in neovim
    OrganizeImports = {
      organize_imports,
      description = "Organize Imports",
    }
  }
}

-- Configure pyright to automatically perform static type checking on python
-- file types.
lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})
