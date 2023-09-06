local M = {
    filetype = {
      -- Format JavaScript files with prettier
      javascript = {
        require("formatter.filetypes.javascript").prettier
      },
      -- Format TypeScript files with prettier
      typescript = {
        require("formatter.filetypes.typescript").prettier
      },
      -- Remove trailing white space from all file types
      ["*"] = {
        require("formatter.filetypes.any").remove_trailing_whitespace
      }
    }
  }
  
  -- Configure auto-formatting on save
  vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    command = "FormatWriteLock"
  })
  
  return M
  