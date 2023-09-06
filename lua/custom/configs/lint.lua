-- Set linters to use by file type
require("lint").linters_by_ft = {
    javascript = {"eslint"},
    typescript = {"eslint"}
  }
  
  -- Configure the plugin to auto-lint on save
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
      require("lint").try_lint()
    end,
  })
  